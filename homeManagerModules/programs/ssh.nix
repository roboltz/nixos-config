{ pkgs, lib, config, ... }:

let
  # onePassPath = "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
  onePassPath = "~/.1password/agent.sock";
in {

  options = {
    ssh.enable = lib.mkEnableOption "enables ssh";
  };

  config = lib.mkIf config.ssh.enable {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      forwardAgent = false;
      addKeysToAgent = "no";
      compression = false;
      serverAliveInterval = 0;
      serverAliveCountMax = 3;
      hashKnownHosts = false;
      userKnownHostsFile = "~/.ssh/known_hosts";
      controlMaster = "no";
      controlPath = "~/.ssh/master-%r@%n:%p";
      controlPersist = "no"; 
    };
    extraConfig = ''
      Host *
          IdentityAgent ${onePassPath}
    '';
  };
  };
}

