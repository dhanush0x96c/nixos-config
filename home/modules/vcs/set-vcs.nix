{ config, pkgs, ... }:

let
  userName = config.my.user.name;
  githubEmail = config.my.user.githubEmail;
  gitlabEmail = config.my.user.gitlabEmail;

  setVcs = pkgs.writeShellScriptBin "set-vcs" ''
    set -euo pipefail

    show_usage() {
      echo "Usage: set-vcs <github|gitlab|gh|gl>"
      echo ""
      echo "Sets user.name and user.email for Git and Jujutsu in the current repository."
      echo ""
      echo "Options:"
      echo "  github, gh   Use GitHub profile (${githubEmail})"
      echo "  gitlab, gl   Use GitLab profile (${gitlabEmail})"
      echo "  -h, --help   Show this help message"
    }

    if [ "$#" -ne 1 ]; then
      show_usage >&2
      exit 1
    fi

    case "$(printf '%s' "$1" | tr '[:upper:]' '[:lower:]')" in
      -h|--help|help)
        show_usage
        exit 0
        ;;
      github|gh)
        target="GitHub"
        email="${githubEmail}"
        ;;
      gitlab|gl)
        target="GitLab"
        email="${gitlabEmail}"
        ;;
      *)
        echo "Error: Unknown profile '$1'." >&2
        echo "" >&2
        show_usage >&2
        exit 1
        ;;
    esac

    name="${userName}"
    configured=0

    # Configure Git if inside a Git repository
    if command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      git config --local user.name "$name"
      git config --local user.email "$email"
      echo "[Git] Set user.name = '$name'"
      echo "[Git] Set user.email = '$email'"
      configured=1
    fi

    # Configure Jujutsu if inside a Jujutsu repository
    if command -v jj >/dev/null 2>&1 && jj root >/dev/null 2>&1; then
      jj config set --repo user.name "$name"
      jj config set --repo user.email "$email"
      echo "[Jujutsu] Set user.name = '$name'"
      echo "[Jujutsu] Set user.email = '$email'"
      configured=1
    fi

    if [ "$configured" -eq 0 ]; then
      echo "Error: Current directory is neither a Git repository nor a Jujutsu repository." >&2
      exit 1
    fi

    echo ""
    echo "Successfully applied $target identity."
  '';
in
{
  home.packages = [ setVcs ];
}
