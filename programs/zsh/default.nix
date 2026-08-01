{
  pkgs,
  lib,
  config,
  ...
}:

{
  home.packages = [
    pkgs.zsh-completions
  ];

  programs = {
    bash.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      fastSyntaxHighlighting.enable = true;
      defaultKeymap = "emacs";

      initContent =
        let
          early = lib.mkBefore ''
            if [[ "$TERM" == "xterm-kitty" ]]; then
              ZSH_TMUX_AUTOSTART=true
              ZSH_TMUX_AUTOCONNECT=false
            fi
          '';

          normal = ''
            zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

            zstyle ':completion:*:git-checkout:*' sort false
            zstyle ':completion:*:descriptions' format '[%d]'
            zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
            zstyle ':completion:*' menu no
            zstyle ':fzf-tab:complete:cd:*' fzf-preview '${pkgs.eza}/bin/eza -1 --color=always $realpath'
            zstyle ':fzf-tab:*' use-fzf-default-opts yes
            zstyle ':fzf-tab:*' switch-group '<' '>'

            autoload -Uz edit-command-line
            zle -N edit-command-line
            bindkey '^X^E' edit-command-line

            bindkey ' ' magic-space

            bindkey '^P' history-search-backward
            bindkey '^N' history-search-forward

            bindkey '^W' vi-backward-kill-word
            bindkey '^[b' vi-backward-word
            bindkey '^[f' vi-forward-word

            copy-buffer() {
              print -rn -- "$BUFFER" | ${pkgs.wl-clipboard}/bin/wl-copy
              zle -M "Command copied to clipboard"
            }

            zle -N copy-buffer
            bindkey '^Xc' copy-buffer

            setopt AUTO_CD

            bindkey -s '^Xgc' 'git commit -m ""\C-b'
            bindkey -s '^Xr' 'nix run "nixpkgs#"\C-b'
          '';

          late = lib.mkAfter ''
            FAST_HIGHLIGHT_STYLES[global-alias]='fg=blue,bold'
          '';
        in
        lib.mkMerge [
          early
          normal
          late
        ];

      history = {
        append = true;
        expireDuplicatesFirst = true;
        extended = true;
        findNoDups = true;
        ignoreAllDups = true;
        ignoreSpace = true;
        saveNoDups = true;
        share = true;
        save = 5000;
        size = 5000;
      };

      localVariables = {
        WORDCHARS = "";
      };

      historySubstringSearch = {
        enable = true;
        searchUpKey = [
          "^[[A"
          "^[OA"
        ];
        searchDownKey = [
          "^[[B"
          "^[OB"
        ];
      };

      plugins = [
        {
          name = "fzf-tab";
          src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
        }
        {
          name = "git";
          src = "${pkgs.oh-my-zsh}/share/oh-my-zsh/plugins/git";
        }
        {
          name = "tmux";
          src = "${pkgs.oh-my-zsh}/share/oh-my-zsh/plugins/tmux";
        }
        {
          name = "zsh-autopair";
          src = "${pkgs.zsh-autopair}/share/zsh/zsh-autopair";
          file = "autopair.zsh";
        }
      ];

      shellAliases = {
        cat = "${pkgs.bat}/bin/bat";
        la = "ls -lAh";
        md = "mkdir -p";
        mcd = ''f(){ mkdir -p -- "$1" && cd -- "$1"; }; f'';
        tree = "ls --tree --git-ignore";
      };

      shellGlobalAliases = {
        G = "| ${pkgs.ripgrep}/bin/rg";
        Y = "| ${pkgs.wl-clipboard}/bin/wl-copy";
        P = "${pkgs.wl-clipboard}/bin/wl-paste >";
        N = "> /dev/null 2>&1";
        NE = "2> /dev/null";
        NO = "> /dev/null";
      };
    };

    oh-my-posh =
      let
        c = config.lib.stylix.colors;
        toml = builtins.readFile ./oh-my-posh.toml;
        themedToml =
          builtins.replaceStrings
            [
              "@COLOR_FG@"
              "@COLOR_BLUE@"
              "@COLOR_GREEN@"
              "@COLOR_YELLOW@"
              "@COLOR_RED@"
            ]
            [
              c.base05
              c.base0D
              c.base0B
              c.base0A
              c.base08
            ]
            toml;
      in
      {
        enable = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        configFile = pkgs.writeText "oh-my-posh.toml" themedToml;
      };
  };
}
