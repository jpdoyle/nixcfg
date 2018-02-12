{ config, pkgs, ... }:

{
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs; [
        linuxPackages.bbswitch
        cron
        mplayer
        bind

        nano
        #uvccapture
        fswebcam
        libv4l
        v4l_utils
    ];

}

