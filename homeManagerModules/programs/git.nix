{ pkgs, lib, config, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "enables git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          # Copy this to your home.nix and change the values, remove the lib.mkDefault in your home.nix
          name = lib.mkDefault "Ethan Bolton";
          email = lib.mkDefault "ethanhbolton@gmail.com";
          # Public key for 1password
          signingKey = lib.mkDefault "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICJ8XdnxxEbFv18hA1QaKvb08gwwh2uAWGf60FGNXoDy";
        };
        init.defaultBranch = "main";
        safe.directory = "/etc/nixos";
        gpg = {
          format = "ssh";
        };
        "gpg \"ssh\"" = {
          program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
        };
        commit = {
          gpgsign = true;
        };
      };
    };
  };
}
