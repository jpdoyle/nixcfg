{ config, pkgs, ... }:

{
    imports = [
        ./packages.nix
    ];

    system.activationScripts.binbash = {
        text = "! [[ -e /bin/bash ]] && ln -s /bin/sh /bin/bash";
        deps = [ "binsh" ];
    };

    # Set your time zone.
    time.timeZone = "America/New_York";
    programs.zsh.enable = true;


    programs.ssh.askPassword = "";

    fonts.fontconfig.dpi = 96;
    fonts.fonts = with pkgs; [
        mononoki
    ];

    i18n = {
        consoleFont = "lat9w-16";
        consoleKeyMap = "us";
        defaultLocale = "en_US.UTF-8";
    };

    services.syncthing = {
        enable = true;
        user = "joe";
        dataDir = "/home/joe/.config/syncthing";
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.extraUsers.joe = {
        isNormalUser = true;
        home = "/home/joe";
        extraGroups = [ "wheel" "networkmanager" "audio" "pulse" "fuse" ];
        shell = "/run/current-system/sw/bin/zsh";
    };
    # users.extraUsers.guest = {
    #   isNormalUser = true;
    #   uid = 1000;
    # };

    # The NixOS release to be compatible with for stateful data such as databases.
    system.stateVersion = "16.09";
}

