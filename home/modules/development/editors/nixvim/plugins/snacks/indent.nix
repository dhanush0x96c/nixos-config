{ ... }:

{
  plugins.snacks.settings = {
    indent.enabled = true;
    scope.enabled = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ug";
      action.__raw = "function() Snacks.indent.toggle() end";
      options.desc = "Toggle Indent Guides";
    }
  ];
}
