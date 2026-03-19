{ pkgs, lib, config, ... }:

{
  options = {
    docker.enable = lib.mkEnableOption "enable docker";
  };

  config = lib.mkIf config.docker.enable {
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
    virtualisation.docker = {
      enable = true;
    };
  };
}