{ config, ... }:

{
  programs.wofi = {
    enable = true;

    settings = {
      show = "drun";
      width = 750;
      height = 400;
      always_parse_args = true;
      show_all = false;
      term = config.my.terminal.name;
      hide_scroll = true;
      print_command = true;
      insensitive = true;
      prompt = "";
      allow_images = true;
      no_actions = true;
    };

    style = builtins.readFile ./style.css;
  };
}
