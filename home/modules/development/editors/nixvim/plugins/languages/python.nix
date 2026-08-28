{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    pyright
    ruff
  ];

  plugins = {
    lsp.servers = {
      pyright.enable = true;

      ruff = {
        enable = true;
        extraOptions.init_options.settings = {
          logLevel = "error";
        };
        onAttach.function = ''
          if client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          end
        '';
      };
    };

    conform-nvim.settings.formatters_by_ft.python = [
      "ruff_fix"
      "ruff_format"
      "ruff_organize_imports"
    ];

    venv-selector = {
      enable = true;
      settings = {
        options = {
          notify_user_on_venv_activation = true;
        };
      };
    };

    mini.modules.icons = {
      file = {
        ".python-version" = {
          glyph = "";
          hl = "MiniIconsYellow";
        };
      };
    };
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
