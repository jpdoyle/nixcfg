# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./chromebook-audio.nix
      ./packages.nix
    ];
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    systemWide = true;
    package = pkgs.pulseaudioFull;
    # extraConfig = ''
    # [Element Speaker]
    # switch = mute
    # volume = zero
    # '';
  };

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/mmcblk0"; # or "nodev" for efi only
  boot.loader.grub.enableCryptodisk = true;

  networking.hostName = "jpd-nixbook"; # Define your hostname.
  networking.networkmanager.enable = true;  # Enables wireless support via wpa_supplicant.

  #hardware.bluetooth.enable = true;

  # hardware.opengl.s3tcSupport = true;
  # hardware.enableAllFirmware = true;
  #services.xserver.useGlamor = true;
#  services.printing.enable = false;
#    nixpkgs.config.allowUnfree = true;
#

  programs.ssh.askPassword = "";

  services.xserver.synaptics = {
    enable = true;
    buttonsMap = [ 1 3 2 ];
    palmDetect = true;
    tapButtons = true;
    twoFingerScroll = true;
    minSpeed = "1.5";
    maxSpeed = "2.5";
    accelFactor = "0.003";
  };

  fonts.fontconfig.dpi = 96;
  fonts.fonts = with pkgs; [
    mononoki
  ];

  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };


  powerManagement.cpuFreqGovernor = "ondemand";

  # Set your time zone.
  time.timeZone = "America/New_York";
  programs.zsh.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  
  services.gnome3.gvfs.enable = true;

  services.xserver.displayManager.slim = {
      enable = true;
      theme = pkgs.fetchurl {
          url = "https://github.com/edwtjo/nixos-black-theme/archive/v1.0.tar.gz";
          sha256 = "13bm7k3p6k7yq47nba08bn48cfv536k4ipnwwp1q1l2ydlp85r9d";
      };
  };
  services.xserver.windowManager.awesome = {
    enable = true;
    luaModules = [ pkgs.luaPackages.vicious ];
  };
  services.udisks2.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.joe = {
    isNormalUser = true;
    home = "/home/joe";
    extraGroups = [ "wheel" "networkmanager" "audio" "pulse" "fuse" ];
    shell = "/run/current-system/sw/bin/zsh";
  };
  # users.extraUsers.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };
  
  powerManagement.powerDownCommands = "xscreensaver-command -lock";

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";

}
