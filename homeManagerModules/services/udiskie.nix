{ pkgs, lib, config,  ... }:


{
  options = {
    udiskie.enable = lib.mkEnableOption "enables udiskie";
  };

  config = lib.mkIf config.udiskie.enable {
  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
	file_manager = "${pkgs.nautilus}/bin/nautilus";
      };
    };
  };
  };
}
