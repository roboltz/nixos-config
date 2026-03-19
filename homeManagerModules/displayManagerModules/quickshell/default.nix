{ lib, config, ... }:

{
  imports = [
    ./shell.nix
    ./Colors.nix
    ./Fonts.nix
    ./modules
  ];
}