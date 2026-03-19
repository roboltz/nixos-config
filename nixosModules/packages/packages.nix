{ pkgs, lib, config, ... }:

{
  options = {
    essential-packages.enable = lib.mkEnableOption "enable extra packages";
  };


  config = lib.mkIf config.essential-packages.enable {

    environment.systemPackages = with pkgs; [
      # Essential
      vim
      wget
    ];
  };
}
