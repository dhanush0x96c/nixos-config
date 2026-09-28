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
    };

    conform-nvim.settings.formatters_by_ft.rust = [
      "rustfmt"
    ];
  };
}
