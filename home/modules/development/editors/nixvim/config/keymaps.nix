{ ... }:

{
  keymaps = [
    # Window navigation
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Go to Left Window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Go to Lower Window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Go to Upper Window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Go to Right Window";
    }

    # Window splitting & management
    {
      mode = "n";
      key = "<leader>-";
      action = "<C-w>s";
      options.desc = "Split Window Below";
    }
    {
      mode = "n";
      key = "<leader>|";
      action = "<C-w>v";
      options.desc = "Split Window Right";
    }
    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-w>c";
      options.desc = "Delete Window";
    }

    # Buffer navigation & management
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev Buffer";
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
      options.desc = "Next Buffer";
    }
    {
      mode = "n";
      key = "[b";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev Buffer";
    }
    {
      mode = "n";
      key = "]b";
      action = "<cmd>bnext<cr>";
      options.desc = "Next Buffer";
    }
    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>e #<cr>";
      options.desc = "Switch to Other Buffer";
    }

    # Clear search highlight
    {
      mode = [
        "i"
        "n"
      ];
      key = "<esc>";
      action = "<cmd>noh<cr><esc>";
      options.desc = "Escape and Clear hlsearch";
    }

    # Save file
    {
      mode = [
        "i"
        "x"
        "n"
        "s"
      ];
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options.desc = "Save File";
    }

    # Move lines in Visual mode
    {
      mode = "v";
      key = "<A-j>";
      action = ":m '>+1<cr>gv=gv";
      options.desc = "Move Down";
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":m '<-2<cr>gv=gv";
      options.desc = "Move Up";
    }

    # Better indenting
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options.desc = "Indent Left";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options.desc = "Indent Right";
    }
  ];
}
