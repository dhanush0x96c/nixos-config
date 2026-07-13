{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      zen-browser,
      ...
    }:
    {
      nixosConfigurations.tesseract = nixpkgs.lib.nixosSystem {

        specialArgs = {
          inherit inputs;
        };

        modules = [ ./configuration.nix ];
      };
    };
}
