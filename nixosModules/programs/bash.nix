{ pkgs, lib, config, ... }:

let
  color_fg0       = "#${config.lib.stylix.colors.base01}";
  color_fg0_light = "#${config.lib.stylix.colors.base05}";
  color_bg1       = "#${config.lib.stylix.colors.base01}";
  color_bg3       = "#${config.lib.stylix.colors.base03}";
  color_blue      = "#${config.lib.stylix.colors.base0D}";
  color_aqua      = "#${config.lib.stylix.colors.base0C}";
  color_green     = "#${config.lib.stylix.colors.base0B}";
  color_orange    = "#${config.lib.stylix.colors.base09}";
  color_purple    = "#${config.lib.stylix.colors.base0E}";
  color_red       = "#${config.lib.stylix.colors.base08}";
  color_yellow    = "#${config.lib.stylix.colors.base0A}";

  NixOS = "";

  gruvboxPreset = builtins.fromTOML (builtins.readFile (
    pkgs.fetchurl {
      url = "https://starship.rs/presets/toml/gruvbox-rainbow.toml";
      sha256 = "sha256-P5+A3bi301zYRrm6EXzFfpSVdCWCOFttzxyF+pI2Th8=";
    }
  ));
in
{
  options = {
    bash.enable = lib.mkEnableOption "enable bash";
  };

  config = lib.mkIf config.bash.enable {
    programs.bash = {
      enable = true;
    };

    programs.starship = {
      enable = true;
      settings = gruvboxPreset // {
        palette = "gruvbox_dark";
        palettes.gruvbox_dark = {
          inherit color_fg0 color_fg0_light color_bg1 color_bg3
                  color_blue color_aqua color_green
                  color_orange color_purple color_red
                  color_yellow;
        };
        os = (gruvboxPreset.os or {}) // {
          symbols = (gruvboxPreset.os.symbols or {}) // {
            NixOS = "󱄅";
          };
        };

        time = (gruvboxPreset.time or {}) // {
          style = "fg:color_fg0_light bg:color_bg1";
          format = "[[  $time ](fg:color_fg0_light bg:color_bg1)]($style)";
        };

      };
    };
  };
}