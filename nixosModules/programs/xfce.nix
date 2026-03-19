{ pkgs, lib, config, callPackage, ... }:

{
  options = {
    xfce.enable = lib.mkEnableOption "enable xfce";
  };

  config = lib.mkIf config.xfce.enable {
    pipewire.enable = false;
    services.xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = true;
        xfce.enable = true;
      };
    };
    services.displayManager.defaultSession = "xfce"; 
  };

}

