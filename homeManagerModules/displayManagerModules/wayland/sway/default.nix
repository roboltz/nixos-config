{ lib, ... }:

{
  imports = [
    ./niri
    ./swayidle.nix
    ./swaylock.nix
  ];

  swayidle.enable = lib.mkDefault false;
  swaylock.enable = lib.mkDefault false;
}
