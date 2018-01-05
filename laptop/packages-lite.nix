{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # giv
    gnome3.eog
    #gqview
    gnome3.nautilus
    acpi
    gitAndTools.gitFull
    acpid

    bashmount
    #sshfsFuse

    openssh_with_kerberos
    #pass
    #spass

    dmidecode
    unzip
    vlc
    cmake
    gcc
    gnumake
    dict
    pcmanfm
    dmenu
    usbutils
    #gnome3.cheese

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
    torbrowser

    xsel

    pciutils

    python27
    python27Packages.pip
    python27Packages.virtualenv
    python27Packages.setuptools
    python27Packages.pygtk

    evince

    arandr

     #deluge
    sl
    scrot

    ag
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

  #nixpkgs.config.git = {
  #    guiSupport = true;
  #};

  nixpkgs.config.firefox = {
      #enableGoogleTalkPlugin = true;
      # enableAdobeFlash = true;
  };

}



