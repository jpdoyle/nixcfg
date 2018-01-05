{ config, pkgs, ... }:

{
    imports = [
        ./chromebook/config.nix
        ./generic/core.nix
        ./laptop/core.nix
        ./laptop/netman.nix
    ];

    networking.hostName = "jpd-nixbook";
}
