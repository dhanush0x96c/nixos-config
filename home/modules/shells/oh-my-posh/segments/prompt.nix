{ c }:

{
  type = "text";
  style = "plain";
  foreground_templates = [
    "{{ if eq .Code 0 }}#${c.base0B}{{ end }}"
    "{{ if ne .Code 0 }}#${c.base08}{{ end }}"
  ];
  template = "❯";
}
