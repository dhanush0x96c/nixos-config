{ pkgs, ... }:

let
  tsJsSettings = {
    updateImportsOnFileMove.enabled = "always";
    suggest.completeFunctionCalls = true;
    inlayHints = {
      enumMemberValues.enabled = true;
      functionLikeReturnTypes.enabled = true;
      parameterNames.enabled = "literals";
      parameterTypes.enabled = true;
      propertyDeclarationTypes.enabled = true;
      variableTypes.enabled = false;
    };
  };
in
{
  extraPackages = with pkgs; [
    emmet-language-server
    prettier
    tailwindcss-language-server
    typescript
    vscode-langservers-extracted
    vtsls
  ];

  plugins = {
    lsp.servers = {
      cssls.enable = true;
      emmet_language_server.enable = true;
      eslint = {
        enable = true;
        settings = {
          workingDirectories.mode = "auto";
        };
      };
      html.enable = true;
      jsonls.enable = true;
      tailwindcss.enable = true;
      vtsls = {
        enable = true;
        filetypes = [
          "javascript"
          "javascriptreact"
          "javascript.jsx"
          "typescript"
          "typescriptreact"
          "typescript.tsx"
        ];
        settings = {
          complete_function_calls = true;
          vtsls = {
            enableMoveToFileCodeAction = true;
            autoUseWorkspaceTsdk = true;
            experimental = {
              maxInlayHintLength = 30;
              completion = {
                enableServerSideFuzzyMatch = true;
              };
            };
          };
          typescript = tsJsSettings;
          javascript = tsJsSettings;
        };
      };
    };

    conform-nvim.settings.formatters_by_ft = {
      css = [ "prettier" ];
      graphql = [ "prettier" ];
      handlebars = [ "prettier" ];
      html = [ "prettier" ];
      javascript = [ "prettier" ];
      javascriptreact = [ "prettier" ];
      json = [ "prettier" ];
      jsonc = [ "prettier" ];
      less = [ "prettier" ];
      scss = [ "prettier" ];
      typescript = [ "prettier" ];
      typescriptreact = [ "prettier" ];
    };

    mini.modules.icons = {
      file = {
        ".eslintrc.js" = {
          glyph = "󰱺";
          hl = "MiniIconsYellow";
        };
        ".node-version" = {
          glyph = "";
          hl = "MiniIconsGreen";
        };
        ".nvmrc" = {
          glyph = "";
          hl = "MiniIconsGreen";
        };
        ".prettierrc" = {
          glyph = "";
          hl = "MiniIconsPurple";
        };
        "eslint.config.js" = {
          glyph = "󰱺";
          hl = "MiniIconsYellow";
        };
        "package.json" = {
          glyph = "";
          hl = "MiniIconsGreen";
        };
        "tsconfig.json" = {
          glyph = "";
          hl = "MiniIconsAzure";
        };
        "tsconfig.build.json" = {
          glyph = "";
          hl = "MiniIconsAzure";
        };
        "yarn.lock" = {
          glyph = "";
          hl = "MiniIconsBlue";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>co";
      action.__raw = ''
        function()
          vim.lsp.buf.code_action({
            apply = true,
            context = {
              only = { "source.organizeImports" },
              diagnostics = {},
            },
          })
        end
      '';
      options.desc = "Organize Imports";
    }
    {
      mode = "n";
      key = "<leader>cM";
      action.__raw = ''
        function()
          vim.lsp.buf.code_action({
            apply = true,
            context = {
              only = { "source.addMissingImports.ts" },
              diagnostics = {},
            },
          })
        end
      '';
      options.desc = "Add Missing Imports";
    }
    {
      mode = "n";
      key = "<leader>cu";
      action.__raw = ''
        function()
          vim.lsp.buf.code_action({
            apply = true,
            context = {
              only = { "source.removeUnused.ts" },
              diagnostics = {},
            },
          })
        end
      '';
      options.desc = "Remove Unused Imports";
    }
    {
      mode = "n";
      key = "<leader>cD";
      action.__raw = ''
        function()
          vim.lsp.buf.code_action({
            apply = true,
            context = {
              only = { "source.fixAll.ts" },
              diagnostics = {},
            },
          })
        end
      '';
      options.desc = "Fix All Diagnostics";
    }
  ];
}
