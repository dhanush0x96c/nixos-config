{ c }:

{
  type = "shell";
  style = "plain";
  foreground = "#${c.base05}";
  options = {
    mapped_shell_names = {
      bash = "";
      zsh = "󰆍";
      fish = "";
      nu = "󰧚";
    };
  };
  template = "{{ .Name }} ";
}
