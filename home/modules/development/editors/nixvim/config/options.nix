_:

{
  globals = {
    mapleader = " ";
    maplocalleader = "\\";
  };

  opts = {
    # Line numbers
    number = true;
    relativenumber = true;

    # Indentation
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    smartindent = true;

    # Search settings
    ignorecase = true;
    smartcase = true;
    incsearch = true;

    # UI and layout settings
    termguicolors = true;
    signcolumn = "yes";
    cursorline = true;
    scrolloff = 4;
    sidescrolloff = 8;
    wrap = false;

    # Window splitting
    splitbelow = true;
    splitright = true;

    # System and behavior settings
    clipboard = "unnamedplus";
    undofile = true;
    confirm = true;
    updatetime = 200;
    timeoutlen = 300;

    # Folding
    foldlevel = 99;
    foldtext = "";
  };
}
