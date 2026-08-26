{ ... }:

{
  plugins.snacks.settings.scratch = {
    enabled = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>.";
      action.__raw = "function() Snacks.scratch() end";
      options.desc = "Toggle Scratch Buffer";
    }
    {
      mode = "n";
      key = "<leader>S";
      action.__raw = "function() Snacks.scratch.select() end";
      options.desc = "Select Scratch Buffer";
    }
  ];
}
