{ pkgs, lib, config, ... }:

{
  options = {
    plasma.enable = lib.mkEnableOption "enable kde plasma";
  };

  config = lib.mkIf config.plasma.enable {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.plasma-login-manager.enable = true;
      xserver.enable = true;
      tlp.enable = lib.mkForce false;
    };    

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      konsole
      elisa
      kate
      khelpcenter
    ];

    environment.sessionVariables = {
      KWIN_DRM_NO_AMS = "1";
      KWIN_FORCE_SW_CURSOR = "1";
    };
  };

}
