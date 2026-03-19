{ pkgs, lib, ... }:

{
  imports = [
    ./customization/cursors/bibata/modern/classic/bibata-modern-classic.nix
    ./displayManagerModules/.
    ./packages/packages.nix
    ./programs/fastfetch.nix
    ./programs/firefox.nix
    ./programs/git.nix
    ./programs/kitty.nix
    ./programs/ssh.nix
    ./programs/vscode.nix
    ./services/syncthing.nix
    ./services/udiskie.nix
  ];
  
  essential-home-packages.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  ssh.enable = lib.mkDefault true;
  udiskie.enable = lib.mkDefault true;
}
