{ pkgs, config, lib, ... }:
{
  options = {
    quickshell-bar-brightness.enable = lib.mkEnableOption "enable quickshell brightness display";
  };

  config = lib.mkIf config.quickshell-bar-brightness.enable {
    home.packages = [ pkgs.brightnessctl ];

    home.file.".config/quickshell/modules/bar/Brightness.qml".text = ''
      import QtQuick
      import QtQuick.Layouts
      import Qt5Compat.GraphicalEffects
      import Quickshell
      import Quickshell.Io
      import "../../"

      Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: Colors.base01
        height: 25
        width: 70
        radius: 4
        layer.enabled: true
        layer.effect: DropShadow {
          horizontalOffset: 0
          verticalOffset: 1
          radius: false ? 2 : 4
          samples: 16
          color: false ? "#1C1C1C" : "#151515"
        }

        property int brightnessPercent: 0

        function brightnessIcon(percent) {
          if (percent >= 75) return "󰃠"
          else if (percent >= 50) return "󰃟"
          else if (percent >= 25) return "󰃝"
          else return "󰃞"
        }

        Process {
          id: brightnessProc
          command: ["brightnessctl", "--machine-readable"]
          running: true
          stdout: SplitParser {
            onRead: data => {
              // output: name,class,current,percent%,max
              const parts = data.split(",")
              if (parts.length >= 4) {
                const pct = parts[3].replace("%", "").trim()
                brightnessPercent = parseInt(pct) || 0
              }
            }
          }
        }

        Timer {
          interval: 200
          running: true
          repeat: true
          onTriggered: brightnessProc.running = true
        }

        Text {
          id: brightnessDisplay
          anchors {
            centerIn: parent
          }
          text: brightnessIcon(brightnessPercent) + " " + brightnessPercent + "%"
          color: Colors.foreground
          font.family: Fonts.monospace
          font.pixelSize: Fonts.fontSize
        }
      }
    '';
  };
}