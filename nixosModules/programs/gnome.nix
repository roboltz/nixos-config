{ pkgs, lib, config, ... }:

{
  options = {
    gnome.enable = lib.mkEnableOption "enable gnome and gnome apps";
  };

  config = lib.mkIf config.gnome.enable {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.gnome.core-apps.enable = true;
    services.gnome.core-developer-tools.enable = false;
    services.gnome.games.enable = false;
    environment.systemPackages = with pkgs; [
      gnomeExtensions.blur-my-shell
      gnomeExtensions.appindicator
      gnomeExtensions.burn-my-windows
      gnomeExtensions.coverflow-alt-tab
      gnomeExtensionsdash-to-dock
      gnome.Extensionspip-on-top
      gnome-tweaks
      gnome-extension-manager
    ];

    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-user-docs 
      yelp
      gnome-connections
      gnome-console
      gnome-music
      gnome-text-editor
      simple-scan
      gnome-contacts
      seahorse
      epiphany
      gnome-system-monitor
    ];
  };
}
