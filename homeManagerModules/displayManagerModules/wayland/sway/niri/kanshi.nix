{ pkgs, lib, config, ... }:

{
  options = {
    kanshi.enable = lib.mkEnableOption "enables kanshi";
  };

  config = lib.mkIf config.kanshi.enable {
    services.kanshi = {
      enable = true;
      systemdTarget = "graphical-session.target";

      settings = [
        {
          profile.name = "standalone";
          profile.outputs = [
            {
              criteria = "eDP-1";
            }
          ];
        }
        {
          profile.name = "docked";
          profile.outputs = [
            {
              criteria = "eDP-1";
              status = "disable";
            }
            {
              criteria = "HDMI-A-3";
              mode = "2560x1440@143.999";
              position = "0,0";
            }
            {
              criteria = "DP-1";
              mode = "1920x1080@120.000";
              transform = "90";
              position = "-1080,-384";
            }
          ];
        }
      ];
    };
  };
}