_:

{
  programs.zed-editor = {
    enable = true;
    extensions = [ "material-icon-theme" ];
    userSettings = {
      vim_mode = true;
      project_panel = {
        dock = "left";
      };
      icon_theme = "Material Icon Theme";
    };
  };
}
