{ pkgs, lib, config, ... }:

{
  options = {
    quickshell.enable = lib.mkEnableOption "enable quickshell";
  };

  config = lib.mkIf config.quickshell.enable {
    home.packages = with pkgs; [
      qt6.qt5compat
    ];

    home.file.".config/quickshell/shell.qml".text = ''
      //@ pragma UseQApplication
      import QtQuick
      import QtQuick.Layouts
      import Quickshell
      import Quickshell.Wayland
      import Niri 0.1
      
      import "./modules/bar/"

      ShellRoot {
        id: root

          Niri {
            id: niri
            Component.onCompleted: connect()

              onConnected: console.info("Connected to niri")
              onErrorOccurred: function(error) {
                console.error("Niri error:", error)
              }
          }

        LazyLoader{ active: true; component: Bar{} }
      }
    '';
  };
}