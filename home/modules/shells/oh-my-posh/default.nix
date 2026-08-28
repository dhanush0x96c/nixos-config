{ config, ... }:

let
  c = config.lib.stylix.colors;
  seg = path: import path { inherit c; };
in
{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      version = 4;
      final_space = true;
      console_title_template = "{{ .Shell }} in {{ .Folder }}";

      transient_prompt = {
        foreground_templates = [
          "{{ if eq .Code 0 }}#${c.base0B}{{ end }}"
          "{{ if ne .Code 0 }}#${c.base08}{{ end }}"
        ];
        template = "❯ ";
      };

      secondary_prompt = {
        foreground = "#${c.base0B}";
        template = "❯❯";
      };

      blocks = [
        {
          type = "prompt";
          alignment = "left";

          segments = [
            (seg ./segments/os.nix)
            (seg ./segments/shell.nix)
            (seg ./segments/path.nix)
            (seg ./segments/vcs_common.nix)
            (seg ./segments/git.nix)
            (seg ./segments/jujutsu.nix)
          ];
        }
        {
          type = "prompt";
          alignment = "right";
          overflow = "hidden";

          segments = [
            (seg ./segments/executiontime.nix)
            (seg ./segments/status.nix)
          ];
        }
        {
          type = "prompt";
          alignment = "left";
          newline = true;

          segments = [
            (seg ./segments/prompt.nix)
          ];
        }
      ];
    };
  };
}
