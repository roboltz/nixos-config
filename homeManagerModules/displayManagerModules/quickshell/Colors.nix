{ lib, config, ... }:

{
  home.file.".config/quickshell/Colors.qml".text = ''
    pragma Singleton
    import Quickshell

    Singleton {
      // Background / surfaces
      readonly property string base00: "#${config.lib.stylix.colors.base00}"
      readonly property string base01: "#${config.lib.stylix.colors.base01}"
      readonly property string base02: "#${config.lib.stylix.colors.base02}"
      readonly property string base03: "#${config.lib.stylix.colors.base03}"

      // Foreground / text
      readonly property string base04: "#${config.lib.stylix.colors.base04}"
      readonly property string base05: "#${config.lib.stylix.colors.base05}"
      readonly property string base06: "#${config.lib.stylix.colors.base06}"
      readonly property string base07: "#${config.lib.stylix.colors.base07}"

      // Accents
      readonly property string red:     "#${config.lib.stylix.colors.base08}"
      readonly property string orange:  "#${config.lib.stylix.colors.base09}"
      readonly property string yellow:  "#${config.lib.stylix.colors.base0A}"
      readonly property string green:   "#${config.lib.stylix.colors.base0B}"
      readonly property string cyan:    "#${config.lib.stylix.colors.base0C}"
      readonly property string blue:    "#${config.lib.stylix.colors.base0D}"
      readonly property string magenta: "#${config.lib.stylix.colors.base0E}"
      readonly property string brown:   "#${config.lib.stylix.colors.base0F}"

      // Aliases
      readonly property string background: base00
      readonly property string foreground: base05
      readonly property string accent:     blue
    }
  '';
}