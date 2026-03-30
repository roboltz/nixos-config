{ pkgs, lib, config, ... }:

{
  options = {
    theming.enable = lib.mkEnableOption "enable theming with stylix";
  };

  config = lib.mkIf config.theming.enable {
    
    environment.systemPackages = with pkgs; [
      papirus-icon-theme
    ];

    fonts.packages = with pkgs; [
      ibm-plex
      nerd-fonts.adwaita-mono
      nerd-fonts.caskaydia-cove
      nerd-fonts.symbols-only
    ];

    stylix = {
      enable = true;
      #base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/onedark.yaml";
      polarity = "dark";
      image = lib.mkForce ../../assets/wallpapers/dunes.jpg;
      icons = {
        enable = true;
        package = pkgs.papirus-icon-theme;
        light = "Papirus-Light";
        dark = "Papirus-Dark";
      };
      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.adwaita-mono;
          name = "CaskaydiaCove Nerd Font";
        };
        sansSerif = {
          package = pkgs.ibm-plex;
          name = "IBM Plex Sans";
        };
      };
    };
  };
}
