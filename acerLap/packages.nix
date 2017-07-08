{ config, pkgs, ... }:

{
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs; [
        gnome3.dconf

        steam
        stack
        j
        glew
        sfml
        cargo
        gnumeric
        bashmount
        openssl_1_1_0
        openssl
        arduino
        sshfsFuse
        pmount
        mplayer
        espeak
        libreoffice
        gnome3.gedit


        meld

        cabal-install

        wine

        autoconf
        automake
        gnum4
        pkgconfig
        libtool

        keychain
        rfkill
        bluez-tools
        gnome3.nautilus

        ncat
        nmap_graphical
        smbclient
        net_snmp

        coq
        ott
        prooftree

        blender
        openscad
        ao
        # alliance
        antimony
        freecad
        kicad
        leocad
        librecad
        solvespace

        # gnome.gtk
        numix-gtk-theme
        numix-icon-theme
        numix-icon-theme-circle

        openjdk
        jre
        icedtea8_web

        ghostscriptX

        gnome2.gnomeicontheme
        hicolor_icon_theme
        shared_mime_info
        graphviz
        gnome3.cheese
        gimp
        weechat
        deluge

        jre
        openjdk
        ant
        avrgcclibc
        avrdude

        dfu-util
        xfsprogs

        gksu
        screen
        torbrowser

        audacity
        system-config-printer

        #linuxPackages_4_1.openafsClient
        krb5Full
        kerberos
        gnupg

        androidsdk

        ghc
        stack

        google-chrome
        chromium

        lyx
        ipe
        biber
        texlive.combined.scheme-full

        airstrike
        atanks
        blobby
        #btanks
        construo
        liquidwar
        the-powder-toy

        python27Packages.numpy
        python27Packages.pyqt4

        rubber
        gnome3.gnome_terminal

        netpbm
        gocr

        tesseract
        ocropus
        ocrad

        ruby
        poppler_utils
        pdftk

        calibre

        cups-bjnp
        cups-dymo
        cups-filters
        gutenprintBin
        mfcj470dw-cupswrapper
        mfcj6510dw-cupswrapper

        #qmake

        openconnect
        openconnect_openssl
        
        gnome_mplayer
    ];

  nixpkgs.config.firefox.enableAdobeFlash = true;
}

