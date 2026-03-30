{ pkgs, lib, config, callPackage, ... }:

{
  options = {
    i3.enable = lib.mkEnableOption "enable i3";
  };

  config = lib.mkIf config.i3.enable {
    services.xserver = {
      enable = true;

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          j4-dmenu-desktop
          dmenu
          i3lock
        ];
      };
    };

    services.picom = {
      enable = true;
      vSync = true;
      backend = "glx";
      fade = false;
      shadow = false;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };
  };
}

