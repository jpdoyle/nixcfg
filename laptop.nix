{ config, pkgs, ... }:

{
  imports =
    [
      ./chromebook/hardware.nix
      ./packages.nix
    ];


}
