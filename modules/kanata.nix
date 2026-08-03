{ ... }:

{
  services.kanata = {
    enable = true;
    keyboards.default = {
      configFile = ./kanata-config.kbd;
    };
  };
}
