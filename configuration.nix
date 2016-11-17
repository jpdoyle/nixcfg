# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/mmcblk0"; # or "nodev" for efi only
  boot.loader.grub.enableCryptodisk = true;

  networking.hostName = "nixboot"; # Define your hostname.
  networking.networkmanager.enable = true;  # Enables wireless support via wpa_supplicant.

  # hardware.pulseaudio.enable = true;
  # hardware.pulseaudio.package = pkgs.pulseaudioFull;
  #hardware.bluetooth.enable = true;

  hardware.opengl.s3tcSupport = true;
  hardware.enableAllFirmware = true;
  services.xserver.useGlamor = true;
## services.xserver.multitouch.enable = true;
#  services.printing.enable = false;
#    nixpkgs.config.allowUnfree = true;

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

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


  powerManagement.cpuFreqGovernor = "powersave";

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";
  programs.zsh.enable = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    dmidecode
    alsaLib
    alsaPlugins
    alsaUtils
    zip
    unzip
    vlc
    w3m

    xpdf
    man
    lsof
    gcc
    cmake
    autoconf
    automake
    wget
    vim
    git
    curl
    nox
    zsh
    htop
    tree

    ranger
    chromium
    cargo
    awesome
    tmux
    # dropbox-cli
    vimb
    firefox
    xscreensaver
    networkmanagerapplet
    pavucontrol
    alsa-firmware
    firmwareLinuxNonfree
    torbrowser
    tor

    xsel
    libjack2
    jack2Full
    jackmix

    weechat
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
  #services.alsaUtils.enable = true;
  #sound.enable = true;
  nixpkgs.config.allowUnfree = true;

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
