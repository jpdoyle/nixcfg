{ config, pkgs, ... }:

{
    imports = [
        ./acerLap/config.nix
        ./generic/config.nix
        ./laptop/config.nix
        ./laptop/netman.nix
    ];

    networking.hostName = "jpd-nixtop";
}
