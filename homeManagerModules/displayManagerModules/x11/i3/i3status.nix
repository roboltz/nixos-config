{ pkgs, lib, config, ... }:

{
  options = {
    i3status.enable = lib.mkEnableOption "enable i3status";
  };

  config = lib.mkIf config.i3status.enable {
    programs.i3status = {
      enable = true;

      general = {
        colors = true;
        color_good = "#${config.lib.stylix.colors.base0B}";      # green
        color_degraded = "#${config.lib.stylix.colors.base0A}";  # yellow
        color_bad = "#${config.lib.stylix.colors.base08}";       # red
        interval = 1;
      };
    };
  };
}