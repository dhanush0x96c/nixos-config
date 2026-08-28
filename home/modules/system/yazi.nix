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
      opener = {
        extract = [
          {
            run = "ouch d -y %s";
            desc = "Extract here with ouch";
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
