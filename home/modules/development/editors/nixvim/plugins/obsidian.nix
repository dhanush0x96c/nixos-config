_:

{
  plugins.obsidian = {
    enable = true;

    settings = {
      legacy_commands = false;

      workspaces = [
        {
          name = "notes";
          path = "~/Notes";
        }
      ];

      new_notes_location = "current_dir";

      link = {
        style = "wiki";
      };

      picker = {
        name = "snacks.picker";
      };

      ui = {
        enable = false;
      };

      daily_notes = {
        folder = "dailies";
        date_format = "%Y-%m-%d";
      };

      attachments = {
        folder = "assets";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>on";
      action = "<cmd>Obsidian new<cr>";
      options.desc = "New Note";
    }
    {
      mode = "n";
      key = "<leader>oo";
      action = "<cmd>Obsidian quick_switch<cr>";
      options.desc = "Quick Switch (Vault)";
    }
    {
      mode = "n";
      key = "<leader>os";
      action = "<cmd>Obsidian search<cr>";
      options.desc = "Search Notes (Vault)";
    }
    {
      mode = "n";
      key = "<leader>ot";
      action = "<cmd>Obsidian today<cr>";
      options.desc = "Today's Note";
    }
    {
      mode = "n";
      key = "<leader>od";
      action = "<cmd>Obsidian dailies<cr>";
      options.desc = "Daily Notes";
    }
    {
      mode = "n";
      key = "<leader>ob";
      action = "<cmd>Obsidian backlinks<cr>";
      options.desc = "Backlinks";
    }
    {
      mode = "n";
      key = "<leader>oT";
      action = "<cmd>Obsidian tags<cr>";
      options.desc = "Tags";
    }
    {
      mode = "n";
      key = "<leader>ol";
      action = "<cmd>Obsidian link<cr>";
      options.desc = "Link Note";
    }
    {
      mode = "v";
      key = "<leader>ol";
      action = "<cmd>Obsidian link<cr>";
      options.desc = "Link Selection";
    }
    {
      mode = "n";
      key = "<leader>oN";
      action = "<cmd>Obsidian link_new<cr>";
      options.desc = "Link New Note";
    }
    {
      mode = "v";
      key = "<leader>oN";
      action = "<cmd>Obsidian link_new<cr>";
      options.desc = "Link New Note Selection";
    }
    {
      mode = "v";
      key = "<leader>oe";
      action = "<cmd>Obsidian extract_note<cr>";
      options.desc = "Extract Note";
    }
    {
      mode = "n";
      key = "<leader>op";
      action = "<cmd>Obsidian paste_img<cr>";
      options.desc = "Paste Image";
    }
    {
      mode = "n";
      key = "<leader>or";
      action = "<cmd>Obsidian rename<cr>";
      options.desc = "Rename Note";
    }
    {
      mode = "n";
      key = "<leader>ow";
      action = "<cmd>Obsidian workspace<cr>";
      options.desc = "Switch Workspace";
    }
    {
      mode = "n";
      key = "<leader>ox";
      action = "<cmd>Obsidian toggle_checkbox<cr>";
      options.desc = "Toggle Checkbox";
    }
  ];
}
