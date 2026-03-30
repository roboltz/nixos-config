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

    services.libinput.touchpad = {
      naturalScrolling = true;
      tapping = true;          # tap to click
      middleEmulation = true;  # three-finger tap = middle click
      scrollMethod = "twofinger";
    };

    services.picom = {
      enable = true;
      vSync = true;
      backend = "glx";
      fade = true;
      shadow = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };

    environment.systemPackages = with pkgs; [
      nautilus
    ];
  };
}

