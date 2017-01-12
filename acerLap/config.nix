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

}

