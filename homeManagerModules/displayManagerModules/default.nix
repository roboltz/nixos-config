{ pkgs, lib, config, inputs, ... }:

{
  imports = [
    ./wayland
    ./x11
  ];

  options = {
    niri.enable = lib.mkEnableOption "enable niri programs & config";
    plasma.enable = lib.mkEnableOption "enable plasma programs & config";
    dwm.enable = lib.mkEnableOption "enable dwm programs & config";
    i3.enable = lib.mkEnableOption "enable i3 programs & config";
  };

  config = lib.mkMerge [
    (lib.mkIf config.niri.enable {
      niri-config.enable = true;
      kanshi.enable = true;
      swayidle.enable = true;
      swaylock.enable = true;
      waybar.enable = true;
      mako.enable = true;
      wofi.enable = true;
    })
    
    (lib.mkIf config.plasma.enable {
      plasma-config.enable = true;
    })

    (lib.mkIf config.dwm.enable {
      polybar.enable = true;
    })

    (lib.mkIf config.i3.enable {
      i3-config.enable = true;
      i3status.enable = true;
    })
  ];

}
