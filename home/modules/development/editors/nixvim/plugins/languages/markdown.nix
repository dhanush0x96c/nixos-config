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
    prettier
  ];

  plugins = {
    lsp.servers.marksman.enable = true;

    render-markdown.enable = true;

    conform-nvim.settings = {
      formatters = {
        markdownlint-cli2 = {
          prepend_args = [
            "--config"
            "${markdownlintConfig}"
          ];
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
      lintersByFt = {
        markdown = [ "markdownlint-cli2" ];
      };
      linters."markdownlint-cli2".args = [
        "--config"
        "${markdownlintConfig}"
        "-"
      ];
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
