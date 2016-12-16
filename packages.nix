{ config, pkgs, ... }:

#let dropbox-local = pkgs.callPackage ./dropbox-local.nix; in
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
    # w3m
    # haskellPackages.clash-ghc
    # cabal-install
    # ghc
    graphviz
    xterm
    cmake
    gcc
    gnumake
    stack
    dict
    j
    pcmanfm
    dmenu
    xorg.xbacklight

    man
    lsof
    wget
    vim
    git
    curl
    nox
    zsh
    htop
    tree

    ranger
    tmux
    xscreensaver
    networkmanagerapplet
    pavucontrol
    alsa-firmware
    firmwareLinuxNonfree

    firefox
    # vimb
    google-chrome

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

    # python3
    # python35Packages.pip
    # python35Packages.virtualenv
    # python35Packages.setuptools

    evince

    #dropbox
    #(dropbox-local)

    deluge
    sl
    scrot

    ag
    sfml
  ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.git = {
      withManual = true;
      guiSupport = true;
  };

}

