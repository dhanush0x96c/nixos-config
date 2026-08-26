{ ... }:

{
  plugins.snacks.settings = {
    git.enabled = true;
    gitbrowse.enabled = true;
    lazygit.enabled = true;
    gh.enabled = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action.__raw = "function() Snacks.lazygit() end";
      options.desc = "Lazygit (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>gG";
      action.__raw = "function() Snacks.lazygit({ cwd = vim.fn.getcwd() }) end";
      options.desc = "Lazygit (cwd)";
    }
    {
      mode = "n";
      key = "<leader>gb";
      action.__raw = "function() Snacks.picker.git_log_line() end";
      options.desc = "Git Blame Line";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>gB";
      action.__raw = "function() Snacks.gitbrowse() end";
      options.desc = "Git Browse (open)";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>gY";
      action.__raw = ''function() Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false }) end'';
      options.desc = "Git Browse (copy)";
    }
    {
      mode = "n";
      key = "<leader>gf";
      action.__raw = "function() Snacks.picker.git_log_file() end";
      options.desc = "Git Current File History";
    }
    {
      mode = "n";
      key = "<leader>gl";
      action.__raw = "function() Snacks.picker.git_log() end";
      options.desc = "Git Log";
    }
    {
      mode = "n";
      key = "<leader>gL";
      action.__raw = "function() Snacks.picker.git_log({ cwd = vim.fn.getcwd() }) end";
      options.desc = "Git Log (cwd)";
    }
    {
      mode = "n";
      key = "<leader>gi";
      action.__raw = "function() Snacks.picker.gh_issue() end";
      options.desc = "GitHub Issues";
    }
    {
      mode = "n";
      key = "<leader>gp";
      action.__raw = "function() Snacks.picker.gh_pr() end";
      options.desc = "GitHub Pull Requests";
    }
  ];
}
