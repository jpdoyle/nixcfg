{ config, pkgs, ... }:

{
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs; [
        # google-chrome
        #chromium
        alsaLib
        alsa-firmware
        sl

    ];
}

