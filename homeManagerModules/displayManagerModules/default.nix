{ pkgs, lib, config, inputs, ... }:

{
  imports = [
    ./wayland
    ./quickshell
  ];

  options = {
    niri.enable = lib.mkEnableOption "enable niri programs & config";
  };

  config = lib.mkMerge [
    (lib.mkIf config.niri.enable {
      
      home.packages = with pkgs; [
        inputs.qml-niri.packages.${pkgs.stdenv.hostPlatform.system}.quickshell
      ];

      niri-config.enable = true;
      kanshi.enable = true;
      swayidle.enable = true;
      swaylock.enable = true;
      waybar.enable = false;
      quickshell.enable = true;
      mako.enable = true;
      wofi.enable = true;
    })
  ];

}
