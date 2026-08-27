{ pkgs, ... }:

let
  obsidian-excalidraw-plugin = pkgs.stdenv.mkDerivation (finalAttrs: {
    pname = "obsidian-excalidraw-plugin";
    version = "2.26.4";

    srcs = [
      (pkgs.fetchurl {
        url = "https://github.com/zsviczian/obsidian-excalidraw-plugin/releases/download/${finalAttrs.version}/main.js";
        hash = "sha256-sm8/yM+jnP7+jBHILkP4Cv3GQtjKTU7OO92Bf3LUz1o=";
      })
      (pkgs.fetchurl {
        url = "https://github.com/zsviczian/obsidian-excalidraw-plugin/releases/download/${finalAttrs.version}/manifest.json";
        hash = "sha256-9rgX2uovohBmcaYtcjbNyNgG9SRl8f86tTQyMcAgtwM=";
      })
      (pkgs.fetchurl {
        url = "https://github.com/zsviczian/obsidian-excalidraw-plugin/releases/download/${finalAttrs.version}/styles.css";
        hash = "sha256-YVtWDFGTsspO8/8YRNKAeRO8UcQDM8ef3QioQLDEJzU=";
      })
    ];

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out
      for src in $srcs; do
        cp -a "$src" "$out/$(stripHash "$src")"
      done
    '';
  });

  obsidian-tokyo-night-theme = pkgs.stdenv.mkDerivation (finalAttrs: {
    pname = "obsidian-tokyo-night-theme";
    version = "1.1.7";

    srcs = [
      (pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/tcmmichaelb139/obsidian-tokyonight/main/manifest.json";
        hash = "sha256-Ydsb2wbV3fkjq8MeyKw3cLQgx+QRPdGBX+vxmCnUkG4=";
      })
      (pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/tcmmichaelb139/obsidian-tokyonight/main/theme.css";
        hash = "sha256-Ypm6/WyW9QHxUIKH2pr7dJ7QyBhSttPfHSo4IrFY2tA=";
      })
    ];

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out
      for src in $srcs; do
        cp -a "$src" "$out/$(stripHash "$src")"
      done
    '';
  });
in
{
  stylix.targets.obsidian.enable = false;

  programs.obsidian = {
    enable = true;
    cli.enable = true;

    vaults.Notes = {
      enable = true;
    };

    defaultSettings = {
      app = {
        alwaysUpdateLinks = true;
        attachmentFolderPath = "attachments";
        autoPairBrackets = true;
        autoPairMarkdown = true;
        foldHeading = true;
        foldIndent = true;
        livePreview = true;
        newFileLocation = "current";
        promptDelete = true;
        showIndentGuide = true;
        showLineNumber = true;
        spellcheck = false;
        tabSize = 2;
        trashOption = "system";
        useTab = false;
      };

      appearance = {
        baseFontSize = 16;
        cssTheme = "Tokyo Night";
        theme = "obsidian";
        translucency = false;
      };

      corePlugins = [
        "backlink"
        "bookmarks"
        "canvas"
        "command-palette"
        "daily-notes"
        "editor-status"
        "file-explorer"
        "file-recovery"
        "global-search"
        "graph"
        "markdown-importer"
        "note-composer"
        "outgoing-link"
        "outline"
        "page-preview"
        "properties"
        "switcher"
        "tag-pane"
        "templates"
        "word-count"
      ];

      communityPlugins = [
        obsidian-excalidraw-plugin
      ];

      themes = [
        obsidian-tokyo-night-theme
      ];
    };
  };
}
