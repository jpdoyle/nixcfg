{ config, pkgs, ... }:

{
    imports = [
        ./base-cfg.nix
        ./packages.nix
    ];
}

