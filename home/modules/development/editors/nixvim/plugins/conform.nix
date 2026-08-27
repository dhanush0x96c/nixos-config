_:

{
  plugins.conform-nvim = {
    enable = true;

    settings = {
      default_format_opts = {
        lsp_format = "fallback";
        timeout_ms = 1000;
      };
      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 1000;
      };
      notify_on_error = true;
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cf";
      action.__raw = "function() require('conform').format({ async = true, lsp_format = 'fallback' }) end";
      options.desc = "Format Document";
    }
  ];
}
