{ config, pkgs, ... }:

{
    imports = [
        ./oldlap/config.nix
        ./generic/config.nix
        ./laptop/config.nix
    ];

    networking.hostName = "jpd-oldlap";
}
