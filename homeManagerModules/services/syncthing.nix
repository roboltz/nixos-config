{ pkgs, lib, config,  ... }:


{
  options = {
    syncthing.enable = lib.mkEnableOption "enables syncthing";
  };

  config = lib.mkIf config.syncthing.enable {
    services.syncthing = {
      enable = true;
      #openDefaultPorts = true;
      settings = {
        #gui = {
          #user = "boltz";
          #password = "mypassword";
        #};
        devices = {
          "Pixel 9a" = { id = "IAMTYHC-PYHGPQF-O3KQOYD-U4CBOGC-2FCGJYG-Z3RGX5L-QCIEPBN-5YMYEQD"; };
          "Quest 3" = { id = "FLRAHX6-LHNGCWJ-YDRY6Z7-YQUFVUC-WYQOY5T-4H26PAW-JFLRJ7B-UG35BQB"; };
        };
        folders = {
          "Music" = {
            id = "rorcv-7irss";
            path = "/home/boltz/Music";
            devices = [ "Pixel 9a" ];
          };
          "CV" = {
            id = "3zmrl-usabd";
            path = "/home/boltz/Documents/CV";
            devices = [ "Pixel 9a" ];
          };
          "Beat Saber WIP Levels" = {
            id = "tef6a-porut";
            path = "/home/boltz/Beat Saber/Beat Saber_Data/CustomWIPLevels";
            devices = [ "Quest 3" ];
          };
        };
      };
    };
  };
}
