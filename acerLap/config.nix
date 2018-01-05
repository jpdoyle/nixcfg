{ config, pkgs, ... }:

{
    imports = [
        <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
        ./hardware.nix
        ./packages.nix
    ];

    hardware.opengl = {
        driSupport = true;
        driSupport32Bit = true;
    };

    # Teensyduino
    services.udev.extraRules = ''
        ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?",
        ENV{ID_MM_DEVICE_IGNORE}="1"
        ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789A]?",
        ENV{MTP_NO_PROBE}="1"
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="16c0",
        ATTRS{idProduct}=="04[789ABCD]?", MODE:="0666"
        KERNEL=="ttyACM*", ATTRS{idVendor}=="16c0",
        ATTRS{idProduct}=="04[789B]?", MODE:="0666"
    '';

    services.printing = {
	enable = true;
	drivers = [ pkgs.gutenprint ];
    };

    environment.etc."krb5.conf".text = builtins.readFile ./krb5.conf;

    #services.openafsClient.enable = true;

    hardware.bluetooth.enable = true;

    networking.firewall.allowedTCPPorts = [ 8000 ];

    services.syncthing.useInotify = true;

    # services.printing.gutenprint = true;

}

