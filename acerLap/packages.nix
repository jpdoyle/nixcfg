{ config, pkgs, ... }:

{
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs; [
        steam
        stack
        j
        sfml
        cargo
        gnumeric
        bashmount
        openssl_1_1_0
        openssl
        arduino

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
    ];

}

