{ config, pkgs, ... }:

{
    imports = [
        ./chromebook/config.nix
        ./generic/config.nix
        ./laptop/lite.nix
        ./laptop/netman.nix
    ];

    networking.hostName = "jpd-nixbook";
}
