{ pkgs, config, inputs, ... }:

{
  imports = [
    inputs.self.outputs.homeManagerModules.nixos
  ];

  home = {
    username = "admin";
    homeDirectory = "/home/admin";
    stateVersion = "25.11";
  };

  programs.git.settings.user = {
    name = "Admin";
    email = "admin@gmail.com";
    # Public key for 1password
    signingKey = "ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
  };
  
  bibata-modern-classic-cursor.enable = true;

  syncthing.enable = true;
  fastfetch.enable = true;
  vscode.enable = true;
  kitty.enable = true;
  firefox.enable = true;

  # Configuration for niri WM
  niri.enable = true;

  home.packages = with pkgs; [

    # Utilities
    vlc
    _1password-gui
    protonvpn-gui
    qbittorrent-enhanced
    bottles
    flatpak
    kdePackages.discover

    # Productivity
    libreoffice-fresh
    hunspell
    hunspellDicts.en_US-large
    gimp
    krita
    audacity

    # Communication
    vesktop
    element-desktop

    # Gaming
    inputs.hytale-launcher.packages.${pkgs.stdenv.hostPlatform.system}.default
    prismlauncher
    openmw  
    bs-manager
  ];

}
