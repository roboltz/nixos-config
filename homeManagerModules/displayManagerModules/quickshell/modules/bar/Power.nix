{ pkgs, config, lib, ... }:

{
  options = {
    quickshell-bar-power.enable = lib.mkEnableOption "enable quickshell battery display";
  };

  config = lib.mkIf config.quickshell-bar-power.enable {
    home.file.".config/quickshell/modules/bar/Power.qml".text = ''
      import QtQuick
      import QtQuick.Layouts
      import Qt5Compat.GraphicalEffects
      import Quickshell
      import Quickshell.Services.UPower
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

        function batteryIcon(percent, state) {
          const charging = state === UPowerDeviceState.Charging || state === UPowerDeviceState.FullyCharged

          if (charging) {
            if (percent >= 0.8) return "󰂅"
            else if (percent >= 0.6) return "󰂊"
            else if (percent >= 0.4) return "󰂉"
            else if (percent >= 0.2) return "󰂈"
            else return "󰂆"
          }
          else {
            if (percent >= 0.8) return "󰁹"
            else if (percent >= 0.6) return "󰂁"
            else if (percent >= 0.4) return "󰁿"
            else if (percent >= 0.2) return "󰁽"
            else return "󰁻"
          }
        }

        Text {
          id: powerDisplay
          anchors {
            centerIn: parent
          }
          text: batteryIcon(UPower.displayDevice.percentage, UPower.displayDevice.state) + " " + Number(UPower.displayDevice.percentage * 100) + "%"
          color: (UPower.displayDevice.state === UPowerDeviceState.Charging || UPower.displayDevice.state === UPowerDeviceState.FullyCharged)
            ? Colors.blue
            : Colors.foreground
          font.family: Fonts.monospace
          font.pixelSize: Fonts.fontSize
        }
      }
    '';
  };
}