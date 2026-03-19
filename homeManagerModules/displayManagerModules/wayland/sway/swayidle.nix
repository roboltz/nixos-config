{ pkgs, lib, config, ... }:

{
  options = {
    swayidle.enable = lib.mkEnableOption "enables swayidle";
  };

  config = lib.mkIf config.swayidle.enable {
    services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 120; # lock and turn off screen after 2 min
          command = "${pkgs.bash}/bin/sh -c '${pkgs.swaylock-effects}/bin/swaylock -f & ${pkgs.niri}/bin/niri msg action power-off-monitors'";
        }
        {
          timeout = 300; # make system sleep after 5 minutes
          command = "${pkgs.systemd}/bin/systemctl sleep";
        }
      ];
      events = {
        before-sleep = "${pkgs.swaylock-effects}/bin/swaylock -f";
      };
    };
  };
}
