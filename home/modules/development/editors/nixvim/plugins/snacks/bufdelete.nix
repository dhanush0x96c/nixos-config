_:

{
  plugins.snacks.settings.bufdelete = {
    enabled = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>bd";
      action.__raw = "function() Snacks.bufdelete() end";
      options.desc = "Delete Buffer";
    }
    {
      mode = "n";
      key = "<leader>bo";
      action.__raw = "function() Snacks.bufdelete.other() end";
      options.desc = "Delete Other Buffers";
    }
    {
      mode = "n";
      key = "<leader>bi";
      action.__raw = "function() Snacks.bufdelete.invisible() end";
      options.desc = "Delete Invisible Buffers";
    }
    {
      mode = "n";
      key = "<leader>bD";
      action = "<cmd>bdelete<cr>";
      options.desc = "Delete Buffer and Window";
    }
  ];
}
