{ c }:
{
  type = "path";
  style = "plain";
  foreground = "#${c.base0D}";
  template = builtins.concatStringsSep "" [
    "{{ if not .Writable }} {{ end }}"
    "{{ if .Segments.Git }}{{ .Segments.Git.RepoName }}{{ if .Segments.Git.RelativeDir }}/{{ .Segments.Git.RelativeDir }}{{ end }}"
    "{{ else }}{{ .Path }}{{ end }}"
  ];
  options = {
    style = "agnoster_full";
    display_root = true;
    mapped_locations = {
      "re:^(/home/[^/]+)$" = "";
    };
  };
}
