{ pkgs, lib, config, ... }:

{
  options = {
    waybar.enable = lib.mkEnableOption "enable waybar";
  };

  config = lib.mkIf config.waybar.enable {
    stylix.targets.waybar.enable = false;
    programs.waybar = {
      enable = true;
    };

    home.packages = with pkgs; [
      blueman
      networkmanagerapplet
      pwvucontrol
    ];

    xdg.configFile = {
      "waybar/config.jsonc" = {
        force = true;
        source = ./config.jsonc;
      };
      "waybar/nixos-logo.svg" = {
	      source = ./nixos-logo.svg;
      };
      "waybar/power_menu.xml" = {
        source = ./power_menu.xml;
      };
    }; 
    home.file.".config/waybar/style.css" = {
      force = true;
      text = ''
        * {
          font-family: AdwaitaMono Nerd Font;
          font-size: 16px;
        }

        window#waybar {
          background-color: #${config.lib.stylix.colors.base00};
          border-bottom: 2px solid #${config.lib.stylix.colors.base0D};
          color: #${config.lib.stylix.colors.base05};
        }

        window#waybar label.module:not(#custom-power):not(#workspaces), menuitem, #tray, tooltip
        {
          background-color: #${config.lib.stylix.colors.base00};
          margin: 6px 6px 8px 6px;
          border: 1px solid #${config.lib.stylix.colors.base01};
          border-radius: 6px;
          padding: 2px 8px;
          box-shadow: 0px 0px 2px black;
          transition: box-shadow 250ms;
        }

        window#waybar label.module:not(#custom-power):not(#workspaces):hover, menuitem:hover
        {
          box-shadow: 0 0 2px #${config.lib.stylix.colors.base07};
        }



        menu {
          background-color: #${config.lib.stylix.colors.base00};
          padding: 8px;
          border: 2px solid #${config.lib.stylix.colors.base0D};
          border-radius: 12px;
        }

        menuitem {
          padding: 2px;
          margin: 4px 2px;
        }

        menuitem label {
          font-size: 14px;
          padding: 2px;
          margin: 0;
        }

        decoration {
          border-radius: 12px;
          padding: 0; margin: 0;
          box-shadow: 0px 0px 2px #${config.lib.stylix.colors.base00};
          border: none;
        }

        separator {
          background-color: #${config.lib.stylix.colors.base0D};
        }

        #custom-power {
          background-image: url('./nixos-logo.svg');
          /* color: #${config.lib.stylix.colors.base05};*/
          background-repeat: no-repeat;
          background-position: center;
          background-size: contain;
          min-width: 40px;
          padding: 0 0 4px 0;

          margin: 0 8px;
          /*padding: 0 8px 0 0;*/
        }

        #workspaces {
          /*background-color: #222831;*/
          margin: 8px;
          padding: 0 2px;
          border-radius: 6px;
          box-shadow: 0px 0px 2px #222831;
        }

        #workspaces button {
          border-radius: 50%;
          padding: 0 4px;
          margin: 4px;
        }

        #workspaces button:hover {
          /*background-color: #393E46;*/
        }

        #workspaces button.active {
          /*color: #222831;
          background-color: #EEEEEE;*/
          border-radius: 4px;
        }

      '';
    };
  };
}
