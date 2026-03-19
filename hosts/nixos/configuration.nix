{ config, pkgs, lib, inputs, ... }:

{
  # NixOS configuration for a Dell G5 5590 Laptop.
  # Change the configuration in here and users/admin/home.nix however you like.
  # Also check out flake.nix to adjust inputs for the system.
  # When you are finished, remove hardware-configuration.nix and run
  # nixos-generate-config to generate hardware configuration for your device.
  # To rebuild system with new configuration, run sudo nixos-rebuild boot --flake .#HOSTNAME HERE
  # This is assuming flake.nix has a configuration with your hostname and your current
  # directory is in the same layer as flake.nix.
  # After rebuilding, reboot system. Smaller changes can use "switch" instead of "boot" to
  # switch to the new system without rebooting

  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos";

  nixpkgs.config.allowUnfree = true;
  networking.networkmanager.enable = true;
  services.udisks2.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];  

  system.stateVersion = "25.11";

  niri.enable = true;
  steam.enable = true;
  docker.enable = true;

  environment.systemPackages = with pkgs; [
    # Essential
    btop
    fzf
    jdk

    # Gaming
    steam-run
    mangohud
    protonup-ng
  ];

  # Bootloader
  boot.loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
        editor = false;
    };
    efi.canTouchEfiVariables = true;
  };

  # Users
  users.users = {
    admin = {
      isNormalUser = true;
      description = "Admin";
      extraGroups = [ "networkmanager" "wheel" "docker" "kvm" "adbusers" ];
    };
  };
  
  # Home Manager Setup
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users.boltz = import ./users/boltz/home.nix;
  };

  # Locale
  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Graphics
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.beta; 
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    powerManagement = {
      enable = true;
    };
    
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";

      sync.enable = true;

      /* Choose Offload or Sync, Sync for better performance.
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      */
    };
  };

  # Environment Variables
  environment.sessionVariables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # Laptop Power Settings
  services.upower.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;
    };
  };
}
