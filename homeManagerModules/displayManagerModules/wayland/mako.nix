{ pkgs, lib, config,  ... }:


{
  options = {
    mako.enable = lib.mkEnableOption "enables mako";
  };

  config = lib.mkIf config.mako.enable {
    services.mako = {
      enable = true;
      settings = {
        default-timeout = 5000;
        background-color = lib.mkForce "#${config.lib.stylix.colors.base00}";
        border-color = lib.mkForce "#${config.lib.stylix.colors.base0D}";
        text-color = lib.mkForce "#${config.lib.stylix.colors.base05}";
        border-size = 2;
        border-radius = 18;
        layer = "overlay";
        anchor = "top-right";
        margin = "10";
        padding = "10";
        max-visible = 5;
        sort = "-time";
      };
    };
  };
}
