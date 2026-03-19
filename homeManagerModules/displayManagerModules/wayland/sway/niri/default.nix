{ lib, ... }:

{
  imports = [
    ./kanshi.nix
    ./niri-config.nix
  ];

  kanshi.enable = lib.mkDefault false;
  niri-config.enable = lib.mkDefault false;
}
