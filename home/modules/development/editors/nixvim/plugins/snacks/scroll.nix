_:

{
  plugins.snacks.settings = {
    scroll.enabled = true;
    animate.enabled = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>uS";
      action.__raw = "function() Snacks.scroll.toggle() end";
      options.desc = "Toggle Smooth Scroll";
    }
    {
      mode = "n";
      key = "<leader>ua";
      action.__raw = "function() Snacks.animate.toggle() end";
      options.desc = "Toggle Animations";
    }
  ];
}
