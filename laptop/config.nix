{ config, pkgs, ... }:

{
    # Enable the X11 windowing system.
    services.xserver.enable = true;
    services.xserver.layout = "us";

    services.gnome3.gvfs.enable = true;

    services.xserver.displayManager.lightdm.enable = true;
    #services.xserver.displayManager.slim = {
    #    enable = true;
    #    theme = pkgs.fetchurl {
    #        url = "https://github.com/edwtjo/nixos-black-theme/archive/v1.0.tar.gz";
    #        sha256 = "13bm7k3p6k7yq47nba08bn48cfv536k4ipnwwp1q1l2ydlp85r9d";
    #    };
    #};

    services.xserver.windowManager.awesome = {
        enable = true;
        luaModules = [ pkgs.luaPackages.vicious ];
    };
    services.udisks2.enable = true;

    services.logind.extraConfig = ''
        HandlePowerKey=ignore
        HandleLidSwitch=ignore
        '';

    services.xserver.synaptics = {
        enable = true;
        buttonsMap = [ 1 3 2 ];
        palmDetect = true;
        tapButtons = true;
        twoFingerScroll = true;
        minSpeed = "1.5";
        maxSpeed = "2.5";
        accelFactor = "0.003";
    };

    services.acpid = {
        enable = true;
        handlers = {
            powerTap = {
                event = "button/power LNXPWRBN.*";
                action = builtins.readFile ./shutdown-click;
            };
            lidLockSleep = {
                event = "button/lid LID close.*";
                action = builtins.readFile ./suspend.sh;
            };
        };
    };

    # Enables wireless support via networkmanager
    networking.networkmanager.enable = true;

    hardware.pulseaudio = {
        enable = true;
        support32Bit = true;
        #systemWide = true;
        package = pkgs.pulseaudioFull;
        extraConfig = ''
            load-module module-switch-on-connect
        '';
    };
}

