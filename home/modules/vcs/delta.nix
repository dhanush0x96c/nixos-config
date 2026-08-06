{ config, ... }:
let
  c = config.lib.stylix.colors.withHashtag;
in
{

  programs.delta = {
    enable = true;
    enableGitIntegration = true;

    options = {
      navigate = true;
      dark = true;
      hyperlinks = true;
      features = "tokyonight-moon";

      # TODO: Configure program to open
      # hyperlinks-file-link-format = "";

      tokyonight-moon = {
        blame-palette = "${c.base00} ${c.base01} #191a2a #2f334d ${c.base03}";
        commit-decoration-style = "${c.base04} bold box ul";
        dark = true;
        file-decoration-style = "${c.base04}";
        file-style = "${c.base07}";
        hunk-header-decoration-style = "${c.base04} box ul";
        hunk-header-file-style = "bold";
        hunk-header-line-number-style = "bold ${c.base05}";
        hunk-header-style = "file line-number syntax";
        line-numbers-left-style = "${c.base04}";
        line-numbers-minus-style = "bold ${c.base08}";
        line-numbers-plus-style = "bold ${c.base0B}";
        line-numbers-right-style = "${c.base04}";
        line-numbers-zero-style = "${c.base04}";
        # 35% red 65% base
        minus-emph-style = ''bold syntax "#6e404f"'';
        # 20% red 80% base
        minus-style = ''syntax "#4e3444"'';
        # 35% green 65% base
        plus-emph-style = ''bold syntax "#3d6854"'';
        # 20% green 80% base
        plus-style = ''syntax "#2f4043"'';
        map-styles = ''bold purple => syntax "#4e3a69", bold blue => syntax "#2d446e", bold cyan => syntax "#294d58", bold yellow => syntax "#5c4f3a"'';

        syntax-theme = "base16-stylix";
      };
    };
  };
}
