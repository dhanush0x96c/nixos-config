_:

{
  plugins.which-key = {
    enable = true;
    settings = {
      preset = "helix";
      spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = "buffer";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "code";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "file/find";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "git";
        }
        {
          __unkeyed-1 = "<leader>gh";
          group = "hunks";
        }
        {
          __unkeyed-1 = "<leader>q";
          group = "quit/session";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "search";
        }
        {
          __unkeyed-1 = "<leader>u";
          group = "ui";
          icon = {
            icon = "󰙵 ";
            color = "cyan";
          };
        }
        {
          __unkeyed-1 = "<leader>w";
          group = "windows";
          proxy = "<c-w>";
        }
        {
          __unkeyed-1 = "<leader>x";
          group = "diagnostics/quickfix";
          icon = {
            icon = "󱖫 ";
            color = "green";
          };
        }
        {
          __unkeyed-1 = "[";
          group = "prev";
        }
        {
          __unkeyed-1 = "]";
          group = "next";
        }
        {
          __unkeyed-1 = "g";
          group = "goto";
        }
        {
          __unkeyed-1 = "gs";
          group = "surround";
        }
        {
          __unkeyed-1 = "z";
          group = "fold";
        }
        {
          __unkeyed-1 = "<leader>sn";
          group = "noice";
        }
      ];
    };
  };
}
