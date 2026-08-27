{ pkgs, ... }:

{
  home.packages = [ pkgs.glow ];

  programs.yazi = {
    enable = true;
    plugins = {
      system-clipboard = pkgs.yaziPlugins.clipboard;
      piper = pkgs.yaziPlugins.piper;
    };
    settings = {
      plugin = {
        prepend_previewers = [
          {
            url = "*.md";
            run = "piper -- glow -s dark \"$1\"";
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
      ];
    };
  };
}
