{ pkgs, config, lib, ... }:

{
  options = {
    quickshell-bar-workspaces.enable = lib.mkEnableOption "enable quickshell time";
  };

  config = lib.mkIf config.quickshell-bar-workspaces.enable {
    home.file.".config/quickshell/modules/bar/Workspaces.qml".text = ''
      import QtQuick
      import QtQuick.Layouts
      import Qt5Compat.GraphicalEffects
      import Quickshell
      import "../../"

      Rectangle {
        anchors.left: parent.left
        anchors.centerIn: parent
        color: Colors.background
        height: 25
        width: 215

        Rectangle {
          id: workspaceLayout
          anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: parent.right
            leftMargin: 10
            rightMargin: 10
          }

          RowLayout {
            anchors {
              verticalCenter: parent.verticalCenter
            }
            spacing: 5

            Repeater {
              model: niri.workspaces

              Rectangle {
                layer.enabled: true
                layer.effect: DropShadow {
                  horizontalOffset: 0
                  verticalOffset: 1
                  radius: false ? 2 : 4
                  samples: 16
                  color: false ? "#1C1C1C" : "#151515"
                }

                visible: index < 11
                width: 15
                height: 15
                radius: 10
                color: model.isActive ? Colors.foreground : Colors.base01
                MouseArea {
                  anchors.fill: parent
                  cursorShape: Qt.PointingHandCursor
                  onClicked: niri.focusWorkspaceById(model.id)
                }
              }
            }
          }
        }
      }
    '';
  };
}