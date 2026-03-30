{ pkgs, lib, config, inputs, ... }:

{
  options = {
    niri.enable = lib.mkEnableOption "enable niri";
  };

  config = lib.mkIf config.niri.enable {
    nixpkgs.overlays = [ inputs.niri.overlays.niri ];
    programs.niri.enable = true;
    programs.niri.package = pkgs.niri-unstable;
    services.displayManager.ly.enable = true;
    security.polkit.enable = true;
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.swaylock = {};
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    xdg.portal.config.niri = {
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
    #security.rtkit.enable = true;
    #xdg.portal = {
    #  enable = true;
    #  extraPortals = [
    #    pkgs.xdg-desktop-portal-gnome # or xdg-desktop-portal-gtk
    #  ];
    #  config = {
    #    niri = {
    #      "org.freedesktop.impl.portal.ScreenCast" = "gnome";
    #      "org.freedesktop.impl.portal.Screenshot" = "gnome";
    #      default = [ "gnome" ];
    #    };
    #  };
    #}; 
    environment.systemPackages = with pkgs; [ 
      xwayland-satellite
      nautilus
      swaybg
      brightnessctl
      libnotify
    ];
  };
}
