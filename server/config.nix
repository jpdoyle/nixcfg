{ config, pkgs, ... }:

{
    services.sshd.enable = true;
    services.openssh.forwardX11 = true;
    services.openssh.ports = [ 22 1337 ];

    services.cron.enable = true;

}

