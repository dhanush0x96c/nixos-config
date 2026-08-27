{ c }:

let
  cmds = {
    commit_id = ''"jj" "log" "-r" "@" "--no-graph" "-T" "commit_id.shortest()"'';
    commit_message = ''"jj" "log" "-r" "@" "--no-graph" "-T" "description.first_line()"'';
  };
in
{
  type = "jujutsu";
  style = "plain";
  template = builtins.concatStringsSep "" [
    " "
    "{{ if .ClosestBookmarks }}<#${c.base0B}> {{ .ClosestBookmarks }}</><#${c.base03}> • </>{{ end }}"
    "<#${c.base0E}>{{ .ChangeID }}</>"
    "<#${c.base04}>(<#${c.base0D}>{{ cmd ${cmds.commit_id} }}</><#${c.base04}>)</>"
    "{{ if .Working.Changed }}<#${c.base03}> • </><#${c.base0A}>{{ .Working.String }}</>{{ end }}"
    "{{ $msg := cmd ${cmds.commit_message} }}"
    "{{ if $msg }}"
    "<#${c.base03}> • </>"
    "<#${c.base0D}>󰈚 </>"
    "<#${c.base05}>{{ if gt (len $msg) 35 }}{{ trunc 35 $msg }}...{{ else }}{{ $msg }}{{ end }}</>"
    "{{ end }}"
  ];
  options = {
    fetch_status = true;
    ignore_working_copy = false;
    fetch_ahead_counter = true;
  };
}
