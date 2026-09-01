_:

{
  programs.antigravity-cli = {
    enable = true;
    skills = import ./skills;

    settings = {
      colorScheme = "tokyo night";
      notifications = true;
    };

    permissions = {
      allow = [
        # Common read and search commands
        "command(cat)"
        "command(fd)"
        "command(find)"
        "command(grep)"
        "command(ls)"
        "command(rg)"

        # Formatting commands
        "command(nix run nixpkgs#gofmt)"
        "command(nix run nixpkgs#nixfmt)"
        "command(nix run nixpkgs#nixfmt-rfc-style)"
        "command(nix run nixpkgs#prettier)"
        "command(nix run nixpkgs#ruff)"

        # Git read commands
        "command(git branch)"
        "command(git diff)"
        "command(git log)"
        "command(git show)"
        "command(git status)"

        # JJ (Jujutsu) read commands
        "command(jj bookmark list)"
        "command(jj diff)"
        "command(jj log)"
        "command(jj root)"
        "command(jj show)"
        "command(jj status)"

        # Just commands
        "command(just)"
      ];
    };
  };

  home.file.".gemini/antigravity-cli/settings.json".force = true;
}
