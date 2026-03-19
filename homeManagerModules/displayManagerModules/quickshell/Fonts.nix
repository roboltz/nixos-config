{ config, ... }:

{
  home.file.".config/quickshell/Fonts.qml".text = ''
    pragma Singleton
    import Quickshell

    Singleton {
      readonly property string sans:      "${config.stylix.fonts.sansSerif.name}"
      readonly property string monospace: "${config.stylix.fonts.monospace.name}"
      readonly property string serif:     "${config.stylix.fonts.serif.name}"

      readonly property int fontSize:   16

    }
  '';
}