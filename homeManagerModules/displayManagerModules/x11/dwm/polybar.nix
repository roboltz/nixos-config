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
          height = 16;
          background = c.base00;
          foreground = c.base05;

          modules-left = "ewmh";
          modules-center = "xwindow";
          modules-right = "brightness volume battery date";

          font-0 = "${config.stylix.fonts.monospace.name}:size=10;2";

          padding-left = 1;
          padding-right = 1;
          module-margin-left = 0;
          module-margin-right = 0;

          separator = "";
          separator-foreground = c.base03;

          wm-restack = "ewmh";
          override-redirect = false;
        };

        # ── Workspaces ─────────────────────────────────────────────
        "module/ewmh" = {
          type = "internal/dwm";

          label-active = "%name%";
          label-active-foreground = c.base00;
          label-active-background = c.base0D;
          label-active-padding = 2;

          label-occupied = "%name%";
          label-occupied-foreground = c.base05;
          label-occupied-background = c.base01;
          label-occupied-padding = 2;

          label-urgent = "%name%";
          label-urgent-foreground = c.base00;
          label-urgent-background = c.base08;
          label-urgent-padding = 2;

          label-empty = "%name%";
          label-empty-foreground = c.base03;
          label-empty-padding = 2;
        };

        # ── Focused window title ────────────────────────────────────
        "module/xwindow" = {
          type = "internal/xwindow";
          label = "%title%";
          label-maxlen = 60;
          label-foreground = c.base05;
          label-empty = "Desktop";
          label-empty-foreground = c.base03;
        };

        # ── Brightness ─────────────────────────────────────────────
        "module/brightness" = {
          type = "internal/backlight";
          card = "intel_backlight"; # change to your card: ls /sys/class/backlight/
          use-actual-brightness = true;
          poll-interval = 2;

          label = " %percentage%%";
          label-foreground = c.base0A;

          bar-width = 6;
          bar-indicator = "";
          bar-fill = "─";
          bar-empty = "─";
          bar-fill-foreground = c.base0A;
          bar-empty-foreground = c.base03;
        };

        # ── Volume ──────────────────────────────────────────────────
        "module/volume" = {
          type = "internal/pulseaudio";
          use-ui-max = false;

          label-volume = " %percentage%%";
          label-volume-foreground = c.base0B;

          label-muted = " mute";
          label-muted-foreground = c.base03;
        };

        # ── Battery ─────────────────────────────────────────────────
        "module/battery" = {
          type = "internal/battery";
          battery = "BAT0";  # check with: ls /sys/class/power_supply/
          adapter = "AC";
          full-at = 99;
          poll-interval = 5;

          label-charging = " %percentage%%";
          label-charging-foreground = c.base0B;

          label-discharging = " %percentage%%";
          label-discharging-foreground = c.base0E;

          label-full = " full";
          label-full-foreground = c.base0B;

          label-low = " %percentage%%";
          label-low-foreground = c.base08;
          low-at = 15;
        };

        # ── Date & Time ─────────────────────────────────────────────
        "module/date" = {
          type = "internal/date";
          interval = 1;

          date = "%a %d %b";
          time = "%H:%M";

          label = " %date% %time% ";
          label-foreground = c.base0D;
        };
      };
    };
  };
}