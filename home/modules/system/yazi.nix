{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    _7zz
    chafa
    exiftool
    fd
    ffmpeg
    file
    fzf
    imagemagick
    jq
    mediainfo
    ouch
    poppler-utils
    resvg
    ripgrep
    ueberzugpp
    wl-clipboard
    xclip
    zoxide
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
            mime = "application/pdf";
            use = [
              "pdf"
              "reveal"
            ];
          }
          {
            mime = "audio/*";
            use = [
              "play"
              "reveal"
            ];
          }
          {
            mime = "folder/*";
            use = [
              "edit"
              "open"
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
            run = "$EDITOR %s";
            block = true;
            desc = "Edit with $EDITOR";
            for = "unix";
          }
        ];
        extract = [
          {
            run = "${pkgs.ouch}/bin/ouch d -y %s";
            desc = "Extract here with ouch";
            for = "unix";
          }
        ];
        image = [
          {
            run = "${pkgs.imv}/bin/imv %s";
            orphan = true;
            desc = "View with imv";
            for = "unix";
          }
        ];
        pdf = [
          {
            run = "${pkgs.papers}/bin/papers %s";
            orphan = true;
            desc = "View with Papers";
            for = "unix";
          }
        ];
        play = [
          {
            run = "${pkgs.mpv}/bin/mpv %s";
            orphan = true;
            desc = "Play with mpv";
            for = "unix";
          }
        ];
      };
      plugin = {
        prepend_preloaders = [
          {
            url = "${config.my.paths.gdrive}/**";
            run = "noop";
          }
        ];
        prepend_previewers = [
          {
            url = "*.md";
            run = "piper -- ${pkgs.glow}/bin/glow -s dark \"$1\"";
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
