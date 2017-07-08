{ config, pkgs, ... }:

{
    imports = [
        ./glenntop/config.nix
        ./generic/config.nix
        ./laptop/config.nix
    ];

    networking.hostName = "jpd-glenntop";
}
