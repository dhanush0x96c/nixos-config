{ ... }:

{
  plugins.lsp.keymaps = {
    silent = true;

    lspBuf = {
      "gd" = "definition";
      "gD" = "declaration";
      "gy" = "type_definition";
      "gI" = "implementation";
      "K" = "hover";
      "gK" = "signature_help";
      "<leader>ca" = {
        action = "code_action";
        mode = [
          "n"
          "v"
        ];
      };
      "<leader>cr" = "rename";
      "<C-k>" = {
        action = "signature_help";
        mode = "i";
      };
    };

    diagnostic = {
      "[d" = "goto_prev";
      "]d" = "goto_next";
      "<leader>cd" = "open_float";
    };

    extra = [
      {
        mode = "n";
        key = "gr";
        action.__raw = "function() Snacks.picker.lsp_references() end";
        options.desc = "LSP References";
      }
      {
        mode = "n";
        key = "<leader>cl";
        action.__raw = "function() Snacks.picker.lsp_config() end";
        options.desc = "LSP Info";
      }
    ];
  };
}
