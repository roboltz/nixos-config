{pkgs, lib, ... }:

{
  imports = [
    ./packages/packages.nix
    ./programs/bash.nix
    ./programs/gnome.nix
    ./programs/plasma.nix
    ./programs/xfce.nix
    ./programs/dwm.nix
    ./programs/i3.nix
    ./programs/niri.nix
    ./programs/stylix.nix
    ./programs/steam.nix
    ./services/bluetooth.nix
    ./services/pipewire.nix
    ./services/virtual-reality.nix
    ./virtualisation/docker.nix
  ];
  essential-packages.enable = lib.mkDefault true;
  bash.enable = lib.mkDefault true;
  theming.enable = lib.mkDefault true;
  bluetooth.enable = lib.mkDefault true;
  pipewire.enable = lib.mkDefault true;
}
