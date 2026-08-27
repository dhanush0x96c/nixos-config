_:

{
  security.sudo.extraRules = [
    {
      users = [ "dhanush" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
