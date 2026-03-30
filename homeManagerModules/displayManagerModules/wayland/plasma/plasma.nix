{ pkgs, lib, config, ... }:

{
  options = {
    plasma-config.enable = lib.mkEnableOption "enables plasma configuration";
  };

  config = lib.mkIf config.plasma-config.enable {
    stylix.targets.kde = {
      enable = true;
    };
  };
}