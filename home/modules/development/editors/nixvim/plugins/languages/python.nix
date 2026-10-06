_:

{
  plugins = {
    lsp.servers = {
      pyright.enable = true;
      ruff.enable = true;
    };

    conform-nvim.settings.formatters_by_ft = {
      python = [
        "ruff_fix"
        "ruff_format"
        "ruff_organize_imports"
      ];
    };

    mini.modules.icons = {
      file = {
        ".python-version" = {
          glyph = "";
          hl = "MiniIconsYellow";
        };
      };
    };

    venv-selector.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>cv";
      action = "<cmd>VenvSelect<cr>";
      options.desc = "Select VirtualEnv";
    }
  ];
}
