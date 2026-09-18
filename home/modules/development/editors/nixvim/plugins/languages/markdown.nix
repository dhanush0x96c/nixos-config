{ pkgs, ... }:

let
  markdownlintConfig = pkgs.writeText "markdownlint.json" (
    builtins.toJSON {
      MD013 = false;
    }
  );
in
{
  filetype.extension.mdx = "markdown.mdx";

  extraPackages = with pkgs; [
    markdown-toc
    markdownlint-cli2
    marksman
    prettier
  ];

  plugins = {
    conform-nvim.settings = {
      formatters = {
        markdown-toc.condition.__raw = ''
          function(_, ctx)
            for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
              if line:find("<!%-%- toc %-%->") then
                return true
              end
            end
          end
        '';
        markdownlint-cli2 = {
          prepend_args = [
            "--config"
            "${markdownlintConfig}"
          ];
          condition.__raw = ''
            function(_, ctx)
              local diag = vim.tbl_filter(function(d)
                return d.source == "markdownlint"
              end, vim.diagnostic.get(ctx.buf))
              return #diag > 0
            end
          '';
        };
      };

      formatters_by_ft = {
        markdown = [
          "prettier"
          "markdownlint-cli2"
          "markdown-toc"
        ];
        "markdown.mdx" = [
          "prettier"
          "markdownlint-cli2"
          "markdown-toc"
        ];
      };
    };

    lint = {
      lintersByFt.markdown = [ "markdownlint-cli2" ];
      linters."markdownlint-cli2".args = [
        "--config"
        "${markdownlintConfig}"
        "-"
      ];
    };

    lsp.servers.marksman.enable = true;

    render-markdown = {
      enable = true;
      settings = {
        checkbox.enabled = false;
        code = {
          right_pad = 1;
          sign = false;
          width = "block";
        };
        file_types = [
          "markdown"
          "norg"
          "rmd"
          "org"
          "codecompanion"
        ];
        heading = {
          icons = [ ];
          sign = false;
        };
      };
    };
  };

  autoCmd = [
    {
      event = "FileType";
      pattern = [
        "markdown"
        "markdown.mdx"
      ];
      callback.__raw = ''
        function()
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
        end
      '';
    }
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>um";
      action = "<cmd>RenderMarkdown toggle<cr>";
      options.desc = "Toggle Render Markdown";
    }
  ];
}
