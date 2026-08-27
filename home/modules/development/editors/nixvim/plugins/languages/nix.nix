{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    nil
    nixfmt
    statix
  ];

  plugins = {
    lsp.servers.nil_ls = {
      enable = true;
      settings = {
        formatting.command = [ "nixfmt" ];
        nix.flake.autoArchive = true;
      };
    };

    conform-nvim.settings.formatters_by_ft.nix = [ "nixfmt" ];

    lint.lintersByFt.nix = [ "statix" ];
  };
}
