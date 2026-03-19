{ pkgs, lib, config, inputs, ... }:

{
  options = {
    essential-home-packages.enable = lib.mkEnableOption "enable extra packages";
  };

  config = lib.mkIf config.essential-home-packages.enable {

    home.packages = with pkgs; [
    ];
  };
}
