{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs =
    inputs@{ self, nixpkgs, ... }:
    {
      nixosConfigurations.tesseract = nixpkgs.lib.nixosSystem {
        modules = [ ./configuration.nix ];
      };
    };
}
