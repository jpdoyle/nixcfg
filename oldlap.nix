{ config, pkgs, ... }:

{
    imports = [
        ./oldlap/config.nix
        ./generic/config.nix
        ./laptop/config.nix
        ./laptop/supplicant.nix
        ./server/config.nix
    ];

    networking.hostName = "jpd-oldlap";
}
