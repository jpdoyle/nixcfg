{ config, pkgs, ... }:

{
    imports = [
        ./acerLap/config.nix
        ./generic/config.nix
        ./laptop/config.nix
    ];

    networking.hostName = "jpd-nixtop";
}
