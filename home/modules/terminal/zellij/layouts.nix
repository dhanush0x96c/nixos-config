_:

{
  programs.zellij.layouts = {
    dev = ''
      layout {
          default_tab_template {
              pane size=1 borderless=true {
                  plugin location="tab-bar"
              }
              children
              pane size=1 borderless=true {
                  plugin location="status-bar"
              }
          }
          tab name="Agent" {
              pane command="bash" {
                  args "-c" "exec ''${AGENT_CMD:-codex}"
              }
          }
          tab name="Editor" {
              pane command="nvim"
          }
          tab name="Shell"
      }
    '';
  };
}
