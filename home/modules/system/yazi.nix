{ pkgs, ... }:

{
  home.packages = with pkgs; [
    glow
    ouch
  ];

  programs.yazi = {
    enable = true;
    plugins = {
      system-clipboard = pkgs.yaziPlugins.clipboard;
      piper = pkgs.yaziPlugins.piper;
      ouch = pkgs.yaziPlugins.ouch;
    };
    settings = {
      open = {
        prepend_rules = [
          {
            mime = "audio/*";
            use = [
              "play"
              "reveal"
            ];
          }
          {
            mime = "image/*";
            use = [
              "image"
              "reveal"
            ];
          }
          {
            mime = "text/*";
            use = [
              "edit"
              "reveal"
            ];
          }
          {
            mime = "video/*";
            use = [
              "play"
              "reveal"
            ];
          }
        ];
      };
      opener = {
        edit = [
          {
            run = "nvim %s";
            block = true;
            desc = "Edit with Neovim";
            for = "unix";
          }
        ];
        extract = [
          {
            run = "ouch d -y %s";
            desc = "Extract here with ouch";
            for = "unix";
          }
        ];
        image = [
          {
            run = "imv %s";
            orphan = true;
            desc = "View with imv";
            for = "unix";
          }
        ];
        play = [
          {
            run = "mpv %s";
            orphan = true;
            desc = "Play with mpv";
            for = "unix";
          }
        ];
      };
      plugin = {
        prepend_previewers = [
          {
            url = "*.md";
            run = "piper -- glow -s dark \"$1\"";
          }
          {
            mime = "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}";
            run = "ouch";
          }
        ];
      };
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = [ "y" ];
          run = [
            "yank"
            "plugin system-clipboard -- --action=copy"
          ];
          desc = "Yank selected files (copy)";
        }
        {
          on = [ "x" ];
          run = [
            "yank --cut"
            "plugin system-clipboard -- --action=copy"
          ];
          desc = "Yank selected files (cut)";
        }
        {
          on = [ "<C-p>" ];
          run = [ "plugin system-clipboard -- --action=paste" ];
          desc = "Paste yanked system clipboard files";
        }
        {
          on = [ "C" ];
          run = [ "plugin ouch" ];
          desc = "Compress with ouch";
        }
      ];
    };
  };
}
