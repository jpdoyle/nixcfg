{ config, pkgs, ... }:

#let dropbox-local = pkgs.callPackage ./dropbox-local.nix; in
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    eterm
    giv
    evilvte
    gqview
    feh
    xfce.thunar
    sshfsFuse
    pmount
    acpi
    finger_bsd
    gitAndTools.gitFull
    acpid

    dmidecode
    alsaLib
    alsaPlugins
    alsaUtils
    zip
    unzip
    vlc
    sakura
    vimb
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
    epdfview

    xorg.xmodmap
    xorg.xbacklight
    xorg.xkeyboardconfig
    xdg_utils

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

    # cargo

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

    evince

    # dropbox

    arandr

    deluge
    sl
    scrot

    ag
    sfml

    (
     stdenv.mkDerivation rec {
     name = "st-jpdoyle";

     src = fetchgit {
        url = "https://github.com/jpdoyle/st.git";
        rev = "3eea2598b608714624ad52d06e90696d85de9ce8";
        sha256 = "0hyprlv4fx6m2j8hc6ns2sa14zrq01vkw287m5h23mzkqd1w2kj0";
     };

     configFile = stdenv.lib.optionalString (conf!=null) (writeText "config.def.h" conf);
     preBuild = stdenv.lib.optionalString (conf!=null) "cp ${configFile} config.def.h";

     buildInputs = with pkgs;
        [ pkgconfig xorg.libX11 ncurses xorg.libXext xorg.libXft fontconfig ];

     installPhase = ''
        TERMINFO=$out/share/terminfo make install PREFIX=$out
     '';

     meta = {
         homepage = http://st.suckless.org/;
         license = stdenv.lib.licenses.mit;
     };

     conf = builtins.readFile ./config.h;
     }
  )
    # st
  ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.git = {
      withManual = true;
      guiSupport = true;
  };

  nixpkgs.config.firefox = {
      enableGoogleTalkPlugin = true;
      enableAdobeFlash = true;
  };

}

