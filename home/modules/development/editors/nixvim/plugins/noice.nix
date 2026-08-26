{ ... }:

{
  plugins.noice = {
    enable = true;
    settings = {
      cmdline = {
        enabled = true;
      };
      messages = {
        enabled = true;
      };
      popupmenu = {
        enabled = true;
      };
      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
      };
      routes = [
        {
          filter = {
            event = "msg_show";
            any = [
              { find = "%d+L, %d+B"; }
              { find = "; after #%d+"; }
              { find = "; before #%d+"; }
            ];
          };
          view = "mini";
        }
      ];
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
        inc_rename = false;
        lsp_doc_border = false;
      };
      views = {
        notify = {
          backend = "snacks";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "c";
      key = "<S-Enter>";
      action.__raw = ''function() require("noice").redirect(vim.fn.getcmdline()) end'';
      options.desc = "Redirect Cmdline";
    }
    {
      mode = "n";
      key = "<leader>snl";
      action = "<cmd>Noice last<cr>";
      options.desc = "Noice Last Message";
    }
    {
      mode = "n";
      key = "<leader>snh";
      action = "<cmd>Noice history<cr>";
      options.desc = "Noice History";
    }
    {
      mode = "n";
      key = "<leader>sna";
      action = "<cmd>Noice all<cr>";
      options.desc = "Noice All";
    }
    {
      mode = "n";
      key = "<leader>snd";
      action = "<cmd>Noice dismiss<cr>";
      options.desc = "Dismiss All";
    }
    {
      mode = "n";
      key = "<leader>snt";
      action = "<cmd>Noice pick<cr>";
      options.desc = "Noice Picker";
    }
    {
      mode = [
        "i"
        "n"
        "s"
      ];
      key = "<c-f>";
      action.__raw = ''function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end'';
      options = {
        silent = true;
        expr = true;
        desc = "Scroll Forward";
      };
    }
    {
      mode = [
        "i"
        "n"
        "s"
      ];
      key = "<c-b>";
      action.__raw = ''function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end'';
      options = {
        silent = true;
        expr = true;
        desc = "Scroll Backward";
      };
    }
  ];
}
