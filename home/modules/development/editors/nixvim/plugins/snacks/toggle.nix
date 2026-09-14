_:

{
  keymaps = [
    {
      mode = "n";
      key = "<leader>ud";
      action.__raw = "function() Snacks.toggle.diagnostics():toggle() end";
      options.desc = "Toggle Diagnostics";
    }
  ];
}
