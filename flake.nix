{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    waybar.url = "github:Alexays/Waybar";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
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

        modules = [
          ./configuration.nix
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
}
