{ pkgs, config, lib, ... }:
{
  options = {
    quickshell-bar-tray.enable = lib.mkEnableOption "enable quickshell system tray";
  };

  config = lib.mkIf config.quickshell-bar-tray.enable {
    home.file.".config/quickshell/modules/bar/Tray.qml".text = ''
      import QtQuick
      import QtQuick.Layouts
      import Qt5Compat.GraphicalEffects
      import Quickshell
      import Quickshell.Services.SystemTray
      import Quickshell.Widgets
      import "../../"

      Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: Colors.base01
        height: 25
        radius: 4
        width: Math.max(trayRow.width + 10, 10)

        layer.enabled: true
        layer.effect: DropShadow {
          horizontalOffset: 0
          verticalOffset: 1
          radius: false ? 2 : 4
          samples: 16
          color: false ? "#1C1C1C" : "#151515"
        }

        Row {
          id: trayRow
          anchors.centerIn: parent
          spacing: 4

          Repeater {
            model: SystemTray.items

            delegate: Item {
              id: trayDelegate
              required property SystemTrayItem modelData

              width: 20
              height: 20

              IconImage {
                anchors.fill: parent
                source: trayDelegate.modelData.icon
              }

              QsMenuAnchor {
                id: menuAnchor
                anchor.item: trayDelegate
                menu: trayDelegate.modelData.menu
              }

              MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: mouse => {
                  if (mouse.button === Qt.RightButton) {
                    menuAnchor.open()
                  } else if (trayDelegate.modelData.onlyMenu) {
                    menuAnchor.open()
                  } else {
                    trayDelegate.modelData.activate()
                  }
                }
              }
            }
          }
        }
      }
    '';
  };
}