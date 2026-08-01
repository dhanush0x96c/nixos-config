{ pkgs, ... }:

{
  stylix.targets.vscode.enable = false;

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      pkief.material-icon-theme
      enkia.tokyo-night
      vscodevim.vim
    ];
    userSettings = {
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" = "Tokyo Night Storm";
      "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font Mono";
      "terminal.integrated.fontSize" = 16;
      "window.zoomLevel" = 1;
      "editor.fontLigatures" = true;
      "terminal.integrated.fontLigatures.enabled" = true;
      "editor.formatOnSave" = true;
      "files.autoSave" = "afterDelay";
    };
  };
}
