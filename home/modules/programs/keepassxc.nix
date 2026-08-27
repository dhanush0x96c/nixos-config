_:

{
  programs.keepassxc = {
    enable = true;
    autostart = true;

    settings = {
      General = {
        ConfigVersion = 2;
        AutoSaveAfterEveryChange = true;
        AutoSaveOnExit = true;
        OpenPreviousDatabasesOnStartup = true;
        SingleInstance = true;
      };

      Browser = {
        AlwaysAllowAccess = true;
        Enabled = true;
        UpdateBinaryPath = false;
      };

      GUI = {
        AdvancedSettings = true;
        ApplicationTheme = "system";
        MinimizeOnClose = true;
        MinimizeOnCopy = true;
        MinimizeOnStartup = true;
        MinimizeToTray = true;
        ShowTrayIcon = true;
      };

      Security = {
        ClearClipboard = true;
        ClearClipboardTimeout = 30;
        LockDatabaseIdle = true;
        LockDatabaseIdleSeconds = 1500;
      };

      SSHAgent = {
        Enabled = true;
      };
    };
  };
}
