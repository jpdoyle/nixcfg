{ config, pkgs, ... }:

{
    imports = [
        ./chromebook/config.nix
        ./generic/config.nix
        ./laptop/config.nix
    ];

    networking.hostName = "jpd-nixbook";
}
