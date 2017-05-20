{ config, pkgs, ... }:

{
    imports = [
        ./hardware.nix
    ];


    services.sshd.enable = true;
    services.openssh.forwardX11 = true;
}

