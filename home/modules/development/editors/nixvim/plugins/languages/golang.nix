{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    gofumpt
    golangci-lint
    gotools
  ];

  plugins = {
    lsp.servers = {
      gopls.enable = true;
    };

    conform-nvim.settings.formatters_by_ft = {
      go = [
        "goimports"
        "gofumpt"
      ];
    };

    lint.lintersByFt = {
      go = [ "golangcilint" ];
    };

    mini.modules.icons = {
      file = {
        ".go-version" = {
          glyph = "";
          hl = "MiniIconsBlue";
        };
      };
      filetype = {
        gotmpl = {
          glyph = "󰟓";
          hl = "MiniIconsGrey";
        };
      };
    };
  };
}
