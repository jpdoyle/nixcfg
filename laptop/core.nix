{ config, pkgs, ... }:

{
    imports = [
        ./packages-core.nix
        ./base-cfg.nix
    ];
}

