{ pkgs, lib, config, ... }:

{
  options = {
    bibata-modern-classic-cursor.enable = lib.mkEnableOption "enable bibata modern classic cursor";
  };
  
  config = lib.mkIf config.bibata-modern-classic-cursor.enable {
  home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 24;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom 
        "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Classic.tar.xz"
        "sha256-2Fd0OVSCgFZVLRAVo/MxgHp1qK5WUNhKY685XPYrBmk="
        "Bibata-Modern-Classic";
  };
}
