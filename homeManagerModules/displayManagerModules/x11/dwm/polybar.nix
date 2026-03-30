{ pkgs, lib, config, ... }:


let
  c = config.lib.stylix.colors.withHashtag;
in
{
  options = {
    polybar.enable = lib.mkEnableOption "enable polybar";
  };

  config = lib.mkIf config.polybar.enable {
    services.polybar = {
      enable = true;

      script = "polybar main &";

      settings = {
        "bar/main" = {
          width = "100%";
          height = 24;
          background = c.base00;
          foreground = c.base05;
          border-color = c.base01;

          modules-left = "date";
          modules-center = "";
          modules-right = "cpu memory";

          font-0 = "${config.stylix.fonts.monospace.name}:size=10";
        };

        "module/date" = {
          type = "internal/date";
          interval = 1;
          date = "%a %d %b  %H:%M";
          label = " %date%";
          label-foreground = c.base0D;
        };

        "module/cpu" = {
          type = "internal/cpu";
          interval = 2;
          label = " %percentage%%";
          label-foreground = c.base0B;
        };

        "module/memory" = {
          type = "internal/memory";
          interval = 2;
          label = " %percentage_used%%";
          label-foreground = c.base09;
        };
      };
    };
  };
}