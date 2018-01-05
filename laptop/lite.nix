{ config, pkgs, ... }:

{
    imports = [
        ./packages-lite.nix
        ./base-cfg.nix
    ];
}

