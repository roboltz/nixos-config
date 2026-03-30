{ pkgs, lib, config, ... }:

{
  options = {
    i3-config.enable = lib.mkEnableOption "enable i3 config";
  };

  config = lib.mkIf config.i3-config.enable {
    xsession.windowManager.i3 = {
      enable = true;
      
      config = {
        modifier = "Mod4"; # Super key
        terminal = "kitty";
        
        keybindings = let
          mod = config.xsession.windowManager.i3.config.modifier;

          bg     = "#${config.lib.stylix.colors.base00}";
          fg     = "#${config.lib.stylix.colors.base05}";
          selfg  = "#${config.lib.stylix.colors.base00}";
          selbg  = "#${config.lib.stylix.colors.base0D}";
          font = "${config.stylix.fonts.monospace.name}:size=${toString config.stylix.fonts.sizes.applications}";
          
          dmenuArgs = "-i -nb '${bg}' -nf '${fg}' -sb '${selbg}' -sf '${selfg}' -fn '${font}'";
        in {
          "${mod}+Return" = "exec alacritty";
          "${mod}+d" = "exec j4-dmenu-desktop --dmenu=\"dmenu ${dmenuArgs}\"";
          "${mod}+Shift+q" = "kill";
          "${mod}+Shift+r" = "restart";
          "${mod}+Shift+e" = "exec i3-nagbar -t warning -m 'Exit i3?' -B 'Yes' 'i3-msg exit'";
          
          # Focus
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";
          
          # Move
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";
          
          # Workspaces
          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          
          # Layout
          "${mod}+s" = "layout stacking";
          "${mod}+w" = "layout tabbed";
          "${mod}+e" = "layout toggle split";
          "${mod}+f" = "fullscreen toggle";
        };
        
        bars = [{
          position = "top";
          statusCommand = "${pkgs.i3status}/bin/i3status";
          fonts = {
            names = [ config.stylix.fonts.monospace.name ];
            size = config.stylix.fonts.sizes.terminal * 1.0; # must be a float
          };
          colors = {
            background = "#${config.lib.stylix.colors.base00}";
            statusline = "#${config.lib.stylix.colors.base05}";
            separator  = "#${config.lib.stylix.colors.base03}";
            
            focusedWorkspace = {
              background = "#${config.lib.stylix.colors.base0D}";
              border     = "#${config.lib.stylix.colors.base0D}";
              text       = "#${config.lib.stylix.colors.base00}";
            };
            activeWorkspace = {
              background = "#${config.lib.stylix.colors.base03}";
              border     = "#${config.lib.stylix.colors.base03}";
              text       = "#${config.lib.stylix.colors.base05}";
            };
            inactiveWorkspace = {
              background = "#${config.lib.stylix.colors.base01}";
              border     = "#${config.lib.stylix.colors.base01}";
              text       = "#${config.lib.stylix.colors.base04}";
            };
            urgentWorkspace = {
              background = "#${config.lib.stylix.colors.base08}";
              border     = "#${config.lib.stylix.colors.base08}";
              text       = "#${config.lib.stylix.colors.base00}";
            };
          };
        }];
      };
    };
    services.autorandr.enable = true;
    programs.autorandr = {
      enable = true;
      profiles = {
        "laptop" = {
          fingerprint = {
            eDP-1-1 = "00ffffffffffff0009e5190800000000201c01049522137802c9a0955d5991291f5054000000010101010101010101010101010101011a3b802471383c403020360058c21000001a482f802471383c403020360058c21000001a000000fe005431574433804e5631354e3344000000000000412196001000000a010a20200042";
          };
          config = {
            eDP-1-1 = {
              enable = true;
              primary = true;
              position = "0x0";
              mode = "1920x1080";
            };
          };
        };

        "docked" = {
          fingerprint = {
            eDP-1-1 = "00ffffffffffff0009e5190800000000201c01049522137802c9a0955d5991291f5054000000010101010101010101010101010101011a3b802471383c403020360058c21000001a482f802471383c403020360058c21000001a000000fe005431574433804e5631354e3344000000000000412196001000000a010a20200042";
            HDMI-0  = "00ffffffffffff0005e326b38503000027230103803c22782e9975ad503fb0260e5054bfef00d1c081803168317c4568457c6168617c565e00a0a0a029503020350055502100001e000000ff0031415052394a41303030393031000000fc005132374733584d4e0a20202020000000fd0030901ee63c000a2020202020200193020348f14b101f05140413030260613f230907078301000067030c001000384467d85dc401788003e200d5e305e301e30f001be60607019191116d1a0000020b3090e60591119511f8e300a0a0a032503020980455502100001a6fc200a0a0a055503020350055502100001ef03c00d051a0355060883a0055502100001c001b";
            DP-1-1 = "00ffffffffffff0010ac6ca142303730291f010380351e78ea72b5a75552a027105054a54b00714f8180a9c0d1c00101010101010101023a801871382d40582c45000f282100001e000000fd0030901eaa22000a202020202020000000fc0044454c4c205332343231484746000000ff00474b48344237330a20202020200114020321f24c90040302011f1213113f404e230907078301000067030c001000003c866f80a07038404030203500f2281100001ad88380a07038304030203500f2281100001a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fc";
          };
          config = {
            eDP-1-1 = { enable = false; };
            HDMI-0 = {
              enable = true;
              primary = true;
              position = "1080x240";
              mode = "2560x1440";
              rate = "144.00";
            };
            DP-1-1 = {
              enable = true;
              position = "0x0";
              mode = "1920x1080";
              rate = "120.00";
              rotate = "left";
            };
          };
        };
      };
    };
    stylix.targets.i3.enable = true;
  };
}

