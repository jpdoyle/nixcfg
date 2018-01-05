{ config, pkgs, ... }:

{
    imports = [
        ./hardware.nix
        ./packages.nix
    ];


    services.sshd.enable = true;
    services.openssh.forwardX11 = true;

    #users.extraUsers.joe = {
    #    extraGroups = [ "camera" ];
    #};
}

