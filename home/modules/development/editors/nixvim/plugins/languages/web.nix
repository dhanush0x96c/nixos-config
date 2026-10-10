{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    prettierd
    stylelint
  ];

  plugins = {
    lsp.servers = {
      cssls.enable = true;
      emmet_language_server.enable = true;
      eslint.enable = true;
      html.enable = true;
      jsonls.enable = true;
      tailwindcss.enable = true;
      vtsls.enable = true;
    };

    conform-nvim.settings.formatters_by_ft = {
      css = [ "prettierd" ];
      html = [ "prettierd" ];
      javascript = [ "prettierd" ];
      javascriptreact = [ "prettierd" ];
      json = [ "prettierd" ];
      jsonc = [ "prettierd" ];
      typescript = [ "prettierd" ];
      typescriptreact = [ "prettierd" ];
    };

    lint.lintersByFt = {
      css = [ "stylelint" ];
    };
  };

  globals.project_commands.web = [
    {
      files = [
        "bun.lock"
        "package.json"
      ];
      run = "bun run dev";
    }
    {
      files = [ "package.json" ];
      run = "npm run dev";
    }
  ];
}
