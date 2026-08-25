{ ... }:

{
  plugins.treesitter = {
    enable = true;

    settings = {
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<A-space>";
      action = "van";
      options = {
        remap = true;
        desc = "Init Treesitter Node Selection";
      };
    }
    {
      mode = "x";
      key = "<A-space>";
      action = "an";
      options = {
        remap = true;
        desc = "Increment Treesitter Node Selection";
      };
    }
    {
      mode = "x";
      key = "<A-bs>";
      action = "in";
      options = {
        remap = true;
        desc = "Decrement Treesitter Node Selection";
      };
    }
  ];
}
