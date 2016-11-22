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
    pciutils
    python27Full
    python3
  ];
}

