{ ... }:

{
  plugins.snacks.settings.explorer = {
    enabled = true;
    replace_netrw = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>fe";
      action.__raw = "function() Snacks.explorer() end";
      options.desc = "Explorer Snacks (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>fE";
      action.__raw = "function() Snacks.explorer({ cwd = vim.fn.getcwd() }) end";
      options.desc = "Explorer Snacks (cwd)";
    }
    {
      mode = "n";
      key = "<leader>e";
      action.__raw = "function() Snacks.explorer() end";
      options.desc = "Explorer Snacks (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>E";
      action.__raw = "function() Snacks.explorer({ cwd = vim.fn.getcwd() }) end";
      options.desc = "Explorer Snacks (cwd)";
    }
  ];
}
