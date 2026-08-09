{ c }:
{
  type = "git";
  style = "plain";
  template = builtins.concatStringsSep "" [
    " "
    "{{ if .Detached }}<#${c.base0E}>{{ trunc 7 .Commit.Sha }}</>"
    "{{ else }}<#${c.base0B}>{{ .HEAD }}</>{{ end }}"
    "{{ if .Rebase }}<#${c.base03}> • </><#${c.base0E}> REBASE</>{{ end }}"
    "{{ if .Merge }}<#${c.base03}> • </><#${c.base0C}> MERGE</>{{ end }}"
    "{{ if .CherryPick }}<#${c.base03}> • </><#${c.base0A}> CHERRY-PICK</>{{ end }}"
    "{{ if .Revert }}<#${c.base03}> • </><#${c.base08}>↺ REVERT</>{{ end }}"
    "{{ if gt .Ahead 0 }} <#${c.base0B}>⇡{{ .Ahead }}</>{{ end }}"
    "{{ if gt .Behind 0 }} <#${c.base08}>⇣{{ .Behind }}</>{{ end }}"
    "{{ if gt .StashCount 0 }}<#${c.base03}> • </><#${c.base0E}>󰏖 {{ .StashCount }}</>{{ end }}"
    "{{ if gt .Working.Unmerged 0 }}<#${c.base03}> • </><#${c.base08}>✖ {{ .Working.Unmerged }} conflict(s)</>{{ end }}"
    "{{ if .Staging.Changed }}<#${c.base03}> • </><#${c.base0B}> {{ .Staging.String }}</>{{ end }}"
    "{{ if .Working.Changed }}<#${c.base03}> • </><#${c.base0A}>✎ {{ .Working.String }}</>{{ end }}"
  ];
  options = {
    fetch_status = true;
    fetch_upstream_icon = true;
    branch_icon = " ";
    branch_identical_icon = "";
    disable_with_jj = true;
  };
}
