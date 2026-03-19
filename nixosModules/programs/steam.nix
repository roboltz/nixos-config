{ pkgs, lib, config, ... }:

{
  options = {
    steam.enable = lib.mkEnableOption "enable steam and game services";
  };
  
  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true;
    };
  };
}
