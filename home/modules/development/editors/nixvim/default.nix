{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  stylix.targets.nixvim.enable = false;

  programs.nixvim = {
    enable = true;
    nixpkgs.source = inputs.nixpkgs;

    imports = [
      ./config
    ];
  };
}
