{ c }:
{
  type = "git";
  style = "plain";
  foreground = "#${c.base0B}";
  template = " {{ .UpstreamIcon }}";
  options = {
    fetch_upstream_icon = true;
    git_icon = "";
  };
}
