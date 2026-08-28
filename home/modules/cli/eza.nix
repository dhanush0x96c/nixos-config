_:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    git = true;
    icons = "auto";
    extraOptions = [
      "--header"
      "--group"
      "--group-directories-first"
      "--hyperlink=auto"
    ];
  };
}
