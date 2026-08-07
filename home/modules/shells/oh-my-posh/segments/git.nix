{ c }:
{
  type = "git";
  style = "plain";
  foreground = "#${c.base0B}";
  template = builtins.concatStringsSep "" [
    " {{ .UpstreamIcon }} "
    "{{ if .Detached }}{{ trunc 7 .Commit.Sha }}{{ else }}{{ .HEAD }}{{ end }}"
    "{{ if .BranchStatus }} {{ .BranchStatus }}{{ end }}"
    "{{ if gt .StashCount 0 }} *{{ .StashCount }}{{ end }}"
    "<#${c.base0A}>"
    "{{ if .Staging.Changed }} [{{ .Staging.String }}]{{ end }}"
    "{{ if .Working.Changed }} {{ .Working.String }}{{ end }}</>"
  ];
  options = {
    fetch_status = true;
    fetch_upstream_icon = true;
    branch_icon = " ";
    git_icon = "";
    branch_identical_icon = "";
    branch_gone_icon = "";
  };
}
