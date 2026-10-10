{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    cargo
    clippy
    rust-analyzer
    rustc
    rustfmt
  ];

  plugins = {
    rustaceanvim = {
      enable = true;
      settings = {
        server = {
          standalone = true;
          status_notify_level = false;
          default_settings = {
            rust-analyzer = {
              check = {
                extraEnv = {
                  RUSTC_BOOTSTRAP = "1";
                };
              };
            };
          };
        };
      };
    };

    conform-nvim.settings.formatters_by_ft.rust = [
      "rustfmt"
    ];
  };

  globals.project_commands.rust = [
    {
      files = [ "Cargo.toml" ];
      run = "cargo run -q";
      test = "cargo test -q";
    }
  ];
}
