{ config, pkgs, ... }:

{
    imports = [
        ./packages.nix
        ./base-cfg.nix
    ];
}

