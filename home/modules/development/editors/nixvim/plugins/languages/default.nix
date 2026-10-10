{ ... }:

let
  mkCommandKeymap = key: type: desc: {
    mode = "n";
    inherit key;
    action.__raw = ''
      function()
        local cmd_groups = vim.g.project_commands or {}
        local found = false
        for _, cmds in pairs(cmd_groups) do
          for _, config in ipairs(cmds) do
            if config.${type} then
              local all_found = true
              for _, f in ipairs(config.files) do
                if vim.fn.findfile(f, '.;') == "" then
                  all_found = false
                  break
                end
              end
              if all_found then
                Snacks.terminal(config.${type}, { auto_close = false, win = { keys = { q = 'close' } } })
                found = true
                break
              end
            end
          end
          if found then break end
        end
        if not found then
          vim.notify('No ${type} configuration found', vim.log.levels.WARN)
        end
      end
    '';
    options.desc = desc;
  };
in
{
  imports = [
    ./golang.nix
    ./markdown.nix
    ./nix.nix
    ./python.nix
    ./rust.nix
    ./web.nix
  ];

  keymaps = [
    (mkCommandKeymap "<leader>r" "run" "Run project")
    (mkCommandKeymap "<leader>t" "test" "Test project")
  ];
}
