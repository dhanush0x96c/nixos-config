{ pkgs, ... }:

{
  users.users."dhanush" = {
    isNormalUser = true;
    description = "Dhanush Shetty";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  environment.shells = with pkgs; [ zsh ];
}
