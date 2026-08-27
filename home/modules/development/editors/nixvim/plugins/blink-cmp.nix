_:

{
  plugins.blink-cmp = {
    enable = true;

    settings = {
      appearance.nerd_font_variant = "mono";

      completion.documentation = {
        auto_show = true;
        auto_show_delay_ms = 200;
      };

      keymap = {
        preset = "enter";
        "<C-y>" = [ "select_and_accept" ];
      };

      sources.default = [
        "lsp"
        "path"
        "snippets"
        "buffer"
      ];
    };
  };
}
