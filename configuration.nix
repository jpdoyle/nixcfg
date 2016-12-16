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
  };

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/mmcblk0"; # or "nodev" for efi only
  boot.loader.grub.enableCryptodisk = true;

  networking.hostName = "nixbook"; # Define your hostname.
  networking.networkmanager.enable = true;  # Enables wireless support via wpa_supplicant.

  #hardware.bluetooth.enable = true;

  hardware.opengl.s3tcSupport = true;
  hardware.enableAllFirmware = true;
  services.xserver.useGlamor = true;
#  services.printing.enable = false;
#    nixpkgs.config.allowUnfree = true;

  services.xserver.synaptics = {
    enable = true;
    buttonsMap = [ 1 2 3 ];
    palmDetect = true;
    tapButtons = true;
    twoFingerScroll = true;
  };

  fonts.fontconfig.dpi = 96;

  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };


  # powerManagement.cpuFreqGovernor = "powersave";

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

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.kdm.enable = true;
  #services.xserver.desktopManager.kde4.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.udisks2.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.guest = {
    isNormalUser = true;
    uid = 1000;
  };
  users.extraUsers.joe = {
    isNormalUser = true;
    home = "/home/joe";
    extraGroups = [ "wheel" "networkmanager" "audio" "pulse" ];
    shell = "/run/current-system/sw/bin/zsh";
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";

}
