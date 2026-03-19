{ pkgs, lib, config, ... }:

{
  options = {
    vscode.enable = lib.mkEnableOption "enables vscode";
  };

  config = lib.mkIf config.vscode.enable {
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
	pkief.material-icon-theme
	ritwickdey.liveserver
        jnoortheen.nix-ide
      ];
      userSettings = { 
	"chat.disableAIFeatures" = true;
	"telemetry.telemetryLevel" = "off";
      };
    };
  };
  };
}
