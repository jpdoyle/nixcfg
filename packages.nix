{ config, pkgs, ... }:


{
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

    j

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
    cargo
    awesome
    tmux
    # dropbox-cli
    xscreensaver
    networkmanagerapplet
    pavucontrol
    alsa-firmware
    firmwareLinuxNonfree

    firefox
    vimb
    # chromium
    google-chrome
    # torbrowser
    tor

    xsel
    libjack2
    jack2Full
    jackmix

    weechat
    pciutils

    python27
    python27Packages.pip
    python27Packages.virtualenv
    python27Packages.setuptools
    pygtk

    python3
    python35Packages.pip
    python35Packages.virtualenv
    python35Packages.setuptools

    evince

    dropbox

    deluge
    sl
    scrot

    #xmodmap
    ag
  ];

  nixpkgs.config.allowUnfree = true;

  # nixpkgs.config.chromium = {
  #     enablePepperFlash = true;
  #     enablePepperPDF = true;
  #     # enableWideVine = true;
  # };

  nixpkgs.config.git = {
      withManual = true;
      guiSupport = true;
  };

}

