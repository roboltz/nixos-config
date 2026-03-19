{ lib, ... }:

{
  imports = [
    ./sway
    ./waybar/waybar.nix
    ./mako.nix
    ./wofi.nix
  ];

  waybar.enable = lib.mkDefault false;
  mako.enable = lib.mkDefault false;
  wofi.enable = lib.mkDefault false;
}
