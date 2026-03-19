{ lib, config, ... }:

{
  imports = [
      ./Bar.nix
      ./Tray.nix
      ./Power.nix
      ./Time.nix
      ./Volume.nix
      ./Brightness.nix
      ./Workspaces.nix
  ];

  quickshell-bar-background.enable = lib.mkDefault true;
  quickshell-bar-tray.enable = lib.mkDefault true;
  quickshell-bar-power.enable = lib.mkDefault true;
  quickshell-bar-volume.enable = lib.mkDefault true;
  quickshell-bar-brightness.enable = lib.mkDefault true;
  quickshell-bar-time.enable = lib.mkDefault true;
  quickshell-bar-workspaces.enable = lib.mkDefault true;

}