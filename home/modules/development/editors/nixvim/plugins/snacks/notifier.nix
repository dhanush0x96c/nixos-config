_:

{
  plugins.snacks.settings.notifier = {
    enabled = true;
    timeout = 3000;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>n";
      action = "<cmd>lua Snacks.picker.notifications()<cr>";
      options.desc = "Notification History";
    }
    {
      mode = "n";
      key = "<leader>un";
      action = "<cmd>lua Snacks.notifier.hide()<cr>";
      options.desc = "Dismiss All Notifications";
    }
  ];
}
