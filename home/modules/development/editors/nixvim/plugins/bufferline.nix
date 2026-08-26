{ ... }:

{
  plugins.bufferline = {
    enable = true;

    settings.options = {
      always_show_bufferline = false;
      close_command.__raw = "function(n) Snacks.bufdelete(n) end";
      diagnostics = "nvim_lsp";
      diagnostics_indicator.__raw = ''
        function(_, _, diagnostics)
          local result = ""
          if diagnostics.error then
            result = result .. "" .. diagnostics.error .. " "
          end
          if diagnostics.warning then
            result = result .. "" .. diagnostics.warning
          end
          return vim.trim(result)
        end
      '';
      get_element_icon.__raw = ''
        function(opts)
          return require("nvim-web-devicons").get_icon_by_filetype(opts.filetype, { default = true })
        end
      '';
      offsets = [
        {
          filetype = "snacks_layout_box";
        }
      ];
      right_mouse_command.__raw = "function(n) Snacks.bufdelete(n) end";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Prev Buffer";
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next Buffer";
    }
    {
      mode = "n";
      key = "[b";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Prev Buffer";
    }
    {
      mode = "n";
      key = "]b";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next Buffer";
    }
    {
      mode = "n";
      key = "<leader>bj";
      action = "<cmd>BufferLinePick<cr>";
      options.desc = "Pick Buffer";
    }
    {
      mode = "n";
      key = "<leader>bl";
      action = "<cmd>BufferLineCloseLeft<cr>";
      options.desc = "Delete Buffers to the Left";
    }
    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options.desc = "Toggle Pin";
    }
    {
      mode = "n";
      key = "<leader>bP";
      action = "<cmd>BufferLineGroupClose ungrouped<cr>";
      options.desc = "Delete Non-Pinned Buffers";
    }
    {
      mode = "n";
      key = "<leader>br";
      action = "<cmd>BufferLineCloseRight<cr>";
      options.desc = "Delete Buffers to the Right";
    }
    {
      mode = "n";
      key = "[B";
      action = "<cmd>BufferLineMovePrev<cr>";
      options.desc = "Move Buffer Prev";
    }
    {
      mode = "n";
      key = "]B";
      action = "<cmd>BufferLineMoveNext<cr>";
      options.desc = "Move Buffer Next";
    }
  ];
}
