{ pkgs, lib, config, ... }:

{
  options = {
    swaylock.enable = lib.mkEnableOption "enable swaylock";
  };
  config = lib.mkIf config.swaylock.enable {
    # blur support
    home.packages = [ pkgs.swaylock-effects ];

    programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = {
        daemonize = true;
        show-failed-attempts = false;
        clock = true;
        timestr = "%H:%M";
        datestr = "%A, %B %e";

        # Screenshot + blur
        screenshots = true;
        effect-blur = "7x5";
        effect-vignette = "0.5:0.5";

        ring-color         = lib.mkForce "${config.lib.stylix.colors.base0D}ff";
        ring-ver-color     = lib.mkForce "${config.lib.stylix.colors.base0C}ff";
        ring-wrong-color   = lib.mkForce "${config.lib.stylix.colors.base08}ff";
        ring-clear-color   = lib.mkForce "${config.lib.stylix.colors.base03}ff";

        key-hl-color       = lib.mkForce "${config.lib.stylix.colors.base0B}ff";
        bs-hl-color        = lib.mkForce "${config.lib.stylix.colors.base08}ff";

        inside-color       = lib.mkForce "${config.lib.stylix.colors.base00}80";
        inside-ver-color   = lib.mkForce "${config.lib.stylix.colors.base00}80";
        inside-wrong-color = lib.mkForce "${config.lib.stylix.colors.base08}40";
        inside-clear-color = lib.mkForce "${config.lib.stylix.colors.base00}80";

        text-color         = lib.mkForce "${config.lib.stylix.colors.base05}ff";
        text-ver-color     = lib.mkForce "${config.lib.stylix.colors.base0C}ff";
        text-wrong-color   = lib.mkForce "${config.lib.stylix.colors.base08}ff";
        text-clear-color   = lib.mkForce "${config.lib.stylix.colors.base03}ff";

        separator-color    = lib.mkForce "00000000";
        line-color         = lib.mkForce "00000000";
        line-ver-color     = lib.mkForce "00000000";
        line-wrong-color   = lib.mkForce "00000000";
        line-clear-color   = lib.mkForce "00000000";

        indicator-idle-visible = true;
        indicator-radius = 80;
        indicator-thickness = 6;
        font-size = 24;
      };
    };
  };
}
