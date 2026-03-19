{ pkgs, config, lib, ... }:
{
  options = {
    quickshell-bar-volume.enable = lib.mkEnableOption "enable quickshell volume display";
  };

  config = lib.mkIf config.quickshell-bar-volume.enable {
    home.file.".config/quickshell/modules/bar/Volume.qml".text = ''
      import QtQuick
      import QtQuick.Layouts
      import Qt5Compat.GraphicalEffects
      import Quickshell
      import Quickshell.Services.Pipewire
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

        PwObjectTracker {
          objects: [Pipewire.defaultAudioSink]
        }

        function volumeIcon(volume, muted) {
          if (muted) return "󰝟"
          else if (volume >= 0.67) return "󰕾"
          else if (volume >= 0.33) return "󰖀"
          else if (volume > 0.0)   return "󰕿"
          else return "󰝟"
        }

        Text {
          id: volumeDisplay
          anchors {
            centerIn: parent
          }
          text: {
            const sink = Pipewire.defaultAudioSink
            const muted = sink?.audio?.muted ?? false
            const vol   = sink?.audio?.volume ?? 0.0
            return volumeIcon(vol, muted) + " " + (muted ? "Mute" : Math.round(vol * 100) + "%")
          }
          color: (Pipewire.defaultAudioSink?.audio?.muted ?? false) ? Colors.red : Colors.foreground
          font.family: Fonts.monospace
          font.pixelSize: Fonts.fontSize
        }
      }
    '';
  };
}