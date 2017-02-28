{ config, pkgs, ... }:

{
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs; [
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
        alliance
        antimony
        freecad
        kicad
        leocad
        librecad
        solvespace

        gtk
        numix-gtk-theme
        numix-icon-theme
        numix-icon-theme-circle

        openjdk
        jre
        icedtea8_web

        gnome.gnomeicontheme
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
    ];
}

