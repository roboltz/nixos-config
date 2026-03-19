{ pkgs, lib, config, ... }:

{
  options = {
    wofi.enable = lib.mkEnableOption "enables wofi";
  };

  config = lib.mkIf config.wofi.enable {
    programs.wofi = {
      enable = true;
      settings = {
        width = 400;
        height = 500;
        location = "center";
        show = "drun";
        prompt = "Search...";
        filter_rate = 100;
        allow_markup = true;
        no_actions = true;
        halign = "fill";
        orientation = "vertical";
        content_halign = "fill";
        insensitive = true;
        allow_images = true;
        image_size = 40;
        gtk_dark = true;
      };
      style = ''
        * {
          font-family: AdwaitaMono Nerd Font;
          font-size: 16px;
        }

        window {
          background-color: transparent;
        }

        #outer-box {
          background-color: #${config.lib.stylix.colors.base00};
          border: 2px solid #${config.lib.stylix.colors.base0D};
          border-radius: 24px;
          padding: 0 12px 12px 12px;   
        }

        #input {
          margin: 12px;
        }

        #input:focus {
          border-color: #${config.lib.stylix.colors.base0D}
        }
        
        viewport {
          border-top: 1px solid #${config.lib.stylix.colors.base0D};
          border-radius: 6px;
        }

        #input, #entry:nth-child(even), #entry:nth-child(odd) {
          background-color: #${config.lib.stylix.colors.base00};
          border: 1px solid #${config.lib.stylix.colors.base01};
          border-radius: 6px;
          box-shadow: 0px 0px 2px black;
        }

        #entry:nth-child(even), #entry:nth-child(odd) {
          margin: 8px;
          transition: background-color 0.1s, border-color 0.1s, box-shadow 0.1s;
        }

        #entry:nth-child(even):selected, #entry:nth-child(odd):selected {
          background-color: #${config.lib.stylix.colors.base05};
          border-color: #${config.lib.stylix.colors.base06};
          box-shadow: 0 0 2px #${config.lib.stylix.colors.base07};
        }

        label {
          margin-left: 4px;
          color: #${config.lib.stylix.colors.base05};
        }

        label:selected {
          color: #${config.lib.stylix.colors.base01};
        }

        #entry:focus {
          outline: none;
        }
      '';
    };
  };
}