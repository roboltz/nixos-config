{ pkgs, config, lib, ... }:

{
  options = {
    quickshell-bar-time.enable = lib.mkEnableOption "enable quickshell time";
  };

  config = lib.mkIf config.quickshell-bar-time.enable {
    home.file.".config/quickshell/modules/bar/Time.qml".text = ''
      import QtQuick
      import QtQuick.Layouts
      import Qt5Compat.GraphicalEffects
      import Quickshell
      import "../../"

      Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: Colors.base01
        height: 25
        width: 150
        radius: 4

        layer.enabled: true
        layer.effect: DropShadow {
          horizontalOffset: 0
          verticalOffset: 1
          radius: false ? 2 : 4
          samples: 16
          color: false ? "#1C1C1C" : "#151515"
        }

        SystemClock {
          id: clock
          precision: SystemClock.Seconds
        }
        Text {
          id: timeBlock
          anchors {
            centerIn: parent
          }
          text: Qt.formatDateTime(clock.date, "dd/MM/yy hh:mm")
          color: Colors.foreground
          font.family: Fonts.monospace
          font.pixelSize: Fonts.fontSize
        }
      }
    '';
  };
}