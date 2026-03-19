{ pkgs, config, lib, ... }:
{
  options = {
    quickshell-bar-background.enable = lib.mkEnableOption "enable quickshell bar background";
  };
  config = lib.mkIf config.quickshell-bar-background.enable {
    home.file.".config/quickshell/modules/bar/Bar.qml".text = ''
      import QtQuick
      import QtQuick.Layouts
      import Quickshell
      import "../../"

      Variants {
        model: Quickshell.screens

        delegate: Component {
          PanelWindow {
            id: bar
            required property var modelData
            screen: modelData

            anchors {
              top: true
              left: true
              right: true
            }
            implicitHeight: 40
            color: "transparent"

            Rectangle {
              anchors.fill: parent
              color: Colors.background

              Rectangle {
                anchors {
                  bottom: parent.bottom
                  left: parent.left
                  right: parent.right
                }
                height: 2
                color: Colors.blue
              }

              // left
              RowLayout {
                anchors {
                  verticalCenter: parent.verticalCenter
                  left: parent.left
                  leftMargin: 25
                }
                Loader { active: true; sourceComponent: Workspaces {} }
              }

              // center
              RowLayout {
                anchors {
                  horizontalCenter: parent.horizontalCenter
                  verticalCenter: parent.verticalCenter
                }
                Image {
                  id: windowIcon
                  width: 20
                  height: 20
                  sourceSize.width: 20
                  sourceSize.height: 20
                  source: niri.focusedWindow?.appId
                    ? "image://icon/" + niri.focusedWindow.appId
                    : ""
                  visible: source !== ""
                  fillMode: Image.PreserveAspectFit
                  Layout.alignment: Qt.AlignVCenter
                }
                Text {
                  text: niri.focusedWindow?.title ? " " + niri.focusedWindow.title : ""
                  font.family: Fonts.monospace
                  font.pixelSize: Fonts.fontSize
                  color: Colors.blue
                }
              }

              // right
              RowLayout {
                anchors {
                  verticalCenter: parent.verticalCenter
                  right: parent.right
                  rightMargin: 25
                }
                spacing: 15
                Loader { active: true; sourceComponent: Tray {} }
                Loader { active: true; sourceComponent: Brightness {} }
                Loader { active: true; sourceComponent: Volume {} }
                Loader { active: true; sourceComponent: Power {} }
                Loader { active: true; sourceComponent: Time {} }
              }
            }
          }
        }
      }
    '';
  };
} 