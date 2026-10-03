_:

{
  programs.zellij.settings = {
    default_shell = "zsh";
    pane_frames = false;
    scroll_buffer_size = 50000;
    mouse_mode = true;
    copy_command = "wl-copy";
    show_startup_tips = false;
    default_mode = "locked";
  };
}
