{ pkgs, lib, config, ... }:

{
  options = {
    dwm.enable = lib.mkEnableOption "enable dwm";
  };

  config = lib.mkIf config.dwm.enable {
    services.xserver = {
      enable = true;
      windowManager.dwm.enable = true;
      
    };
    environment.systemPackages = with pkgs; [
      dmenu        # application launcher (Alt+p by default)
      st           # suckless terminal (also from suckless.org)
      feh          # wallpaper setter
    ];

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

