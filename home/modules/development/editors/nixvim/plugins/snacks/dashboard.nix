{ ... }:

{
  plugins.snacks.settings.dashboard = {
    enabled = true;
    preset.keys = [
      {
        icon = " ";
        key = "f";
        desc = "Find File";
        action = ":lua Snacks.dashboard.pick('files')";
      }
      {
        icon = " ";
        key = "n";
        desc = "New File";
        action = ":ene | startinsert";
      }
      {
        icon = " ";
        key = "g";
        desc = "Find Text";
        action = ":lua Snacks.dashboard.pick('live_grep')";
      }
      {
        icon = " ";
        key = "r";
        desc = "Recent Files";
        action = ":lua Snacks.dashboard.pick('oldfiles')";
      }
      # TODO: Enable persistence.nvim plugin for session management and add the restore session option to the dashboard
      {
        icon = " ";
        key = "q";
        desc = "Quit";
        action = ":qa";
      }
    ];
    sections = [
      { section = "header"; }
      {
        section = "keys";
        gap = 1;
        padding = 1;
      }
    ];
  };
}
