{ ... }:

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
    {
      mode = "n";
      key = "<leader>r";
      action.__raw = ''
        function()
          local run_groups = vim.g.project_run_commands or {}
          local found = false
          for _, run_cmds in pairs(run_groups) do
            for _, config in ipairs(run_cmds) do
              local all_found = true
              for _, f in ipairs(config.files) do
                if vim.fn.findfile(f, '.;') == "" then
                  all_found = false
                  break
                end
              end
              if all_found then
                Snacks.terminal(config.cmd, { auto_close = false, win = { keys = { q = 'close' } } })
                found = true
                break
              end
            end
            if found then break end
          end
          if not found then
            vim.notify('No run configuration found', vim.log.levels.WARN)
          end
        end
      '';
      options.desc = "Run project";
    }
  ];
}
