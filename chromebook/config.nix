{ config, pkgs, ... }:

{
    imports = [
        <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
        ./audio.nix
        ./hardware.nix
        ./packages.nix
    ];

    services.acpid = {
        enable = true;
        handlers = {
            headphonesIn = {
                event = "jack/headphone HEADPHONE plug";
                action = ''
                    headphones=true
                '' + builtins.readFile ./headphones.sh;
            };
            headphonesOut = {
                event = "jack/headphone HEADPHONE unplug";
                action = ''
                    headphones=false
                '' + builtins.readFile ./headphones.sh;
            };
        };
    };

    services.sshd.enable = true;
    services.openssh.forwardX11 = true;

}

