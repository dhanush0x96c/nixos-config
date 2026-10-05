_:

{
  plugins.leetcode = {
    enable = true;

    settings = {
      lang = "rust";
      injector = {
        golang = {
          before = builtins.readFile ./leetcode/golang.go;
          after = "func main() {}";
        };
        python3 = {
          before = builtins.readFile ./leetcode/python3.py;
        };
        rust = {
          before = builtins.readFile ./leetcode/rust.rs;
          after = "fn main() {}";
        };
      };
      plugins = {
        non_standalone = true;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ll";
      action = "<cmd>Leet<cr>";
      options.desc = "Menu / Dashboard";
    }
    {
      mode = "n";
      key = "<leader>lc";
      action = "<cmd>Leet console<cr>";
      options.desc = "Toggle Console";
    }
    {
      mode = "n";
      key = "<leader>ld";
      action = "<cmd>Leet daily<cr>";
      options.desc = "Daily Problem";
    }
    {
      mode = "n";
      key = "<leader>le";
      action = "<cmd>Leet exit<cr>";
      options.desc = "Exit LeetCode";
    }
    {
      mode = "n";
      key = "<leader>li";
      action = "<cmd>Leet info<cr>";
      options.desc = "Problem Info";
    }
    {
      mode = "n";
      key = "<leader>la";
      action = "<cmd>Leet lang<cr>";
      options.desc = "Change Language";
    }
    {
      mode = "n";
      key = "<leader>lL";
      action = "<cmd>Leet last_submit<cr>";
      options.desc = "Last Submitted Code";
    }
    {
      mode = "n";
      key = "<leader>lo";
      action = "<cmd>Leet open<cr>";
      options.desc = "Open in Browser";
    }
    {
      mode = "n";
      key = "<leader>lp";
      action = "<cmd>Leet desc<cr>";
      options.desc = "Toggle Description";
    }
    {
      mode = "n";
      key = "<leader>lq";
      action = "<cmd>Leet list<cr>";
      options.desc = "List Problems";
    }
    {
      mode = "n";
      key = "<leader>lr";
      action = "<cmd>Leet random<cr>";
      options.desc = "Random Problem";
    }
    {
      mode = "n";
      key = "<leader>lR";
      action = "<cmd>Leet reset<cr>";
      options.desc = "Reset Code";
    }
    {
      mode = "n";
      key = "<leader>ls";
      action = "<cmd>Leet submit<cr>";
      options.desc = "Submit Solution";
    }
    {
      mode = "n";
      key = "<leader>lt";
      action = "<cmd>Leet test<cr>";
      options.desc = "Run / Test Solution";
    }
    {
      mode = "n";
      key = "<leader>ly";
      action = "<cmd>Leet yank<cr>";
      options.desc = "Yank Code";
    }
    {
      mode = "n";
      key = "<leader>lC";
      action = "<cmd>Leet cookie update<cr>";
      options.desc = "Update Cookie";
    }
  ];
}
