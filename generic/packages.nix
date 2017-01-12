{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    eterm
    giv
    gqview
    feh
    sshfsFuse
    pmount
    acpi
    finger_bsd
    gitAndTools.gitFull
    acpid
    ntfs3g

    bashmount
    gtk
    gnome.gnomeicontheme
    hicolor_icon_theme
    shared_mime_info
    xorg.xev
    sshfsFuse

    dmidecode
    alsaLib
    alsaPlugins
    alsaUtils
    zip
    unzip
    vlc
    graphviz
    xterm
    cmake
    gcc
    gnumake
    dict
    pcmanfm
    dmenu
    epdfview
    minicom
    usbutils
    gnome3.cheese
    gimp

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

    ranger
    tmux
    xscreensaver
    networkmanagerapplet
    pavucontrol
    alsa-firmware
    firmwareLinuxNonfree

    firefox
    # vimb
    # google-chrome

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

    # deluge
    sl
    scrot

    ag
    python27Packages.pygtk
    python27Packages.syncthing-gtk

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

     conf = builtins.readFile ./st-config.h;
     }
  )
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

