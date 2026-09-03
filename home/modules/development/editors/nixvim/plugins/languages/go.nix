{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    delve
    gofumpt
    golangci-lint
    gomodifytags
    gopls
    gotools
    impl
  ];

  plugins = {
    lsp.servers.gopls = {
      enable = true;
      extraOptions.init_options = {
        semanticTokens = true;
      };
      settings.gopls = {
        gofumpt = true;
        codelenses = {
          gc_details = false;
          generate = true;
          regenerate_cgo = true;
          run_govulncheck = true;
          test = true;
          tidy = true;
          upgrade_dependency = true;
          vendor = true;
        };
        hints = {
          assignVariableTypes = true;
          compositeLiteralFields = true;
          compositeLiteralTypes = true;
          constantValues = true;
          functionTypeParameters = true;
          parameterNames = true;
          rangeVariableTypes = true;
        };
        analyses = {
          nilness = true;
          unusedparams = true;
          unusedwrite = true;
          useany = true;
        };
        usePlaceholders = true;
        completeUnimported = true;
        staticcheck = true;
        directoryFilters = [
          "-.git"
          "-.vscode"
          "-.idea"
          "-.vscode-test"
          "-node_modules"
        ];
      };
      onAttach.function = ''
        if not client.server_capabilities.semanticTokensProvider then
          local semantic = client.config.capabilities.textDocument.semanticTokens
          if semantic then
            client.server_capabilities.semanticTokensProvider = {
              full = true,
              legend = {
                tokenTypes = semantic.tokenTypes,
                tokenModifiers = semantic.tokenModifiers,
              },
              range = true,
            }
          end
        end
      '';
    };

    conform-nvim.settings.formatters_by_ft.go = [
      "goimports"
      "gofumpt"
    ];

    lint.lintersByFt.go = [
      "golangcilint"
    ];

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

  extraConfigLua = ''
    local lint = require("lint")
    if lint.linters.golangcilint and lint.linters.golangcilint.args then
      if not vim.tbl_contains(lint.linters.golangcilint.args, "--enable=revive") then
        table.insert(lint.linters.golangcilint.args, 2, "--enable=revive")
      end
    end
  '';
}
