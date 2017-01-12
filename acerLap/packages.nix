{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    steam
    stack
    j
    sfml
    cargo
    gnumeric
    bashmount
  ];

}

