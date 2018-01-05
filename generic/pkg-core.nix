{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    acpi
    acpid

    bashmount
    #sshfsFuse

    openssh_with_kerberos
    #pass
    #spass

    dmidecode
    dict
    usbutils
    #gnome3.cheese

    man
    lsof
    wget
    vim
    git
    curl
    zsh
    htop
    tree

    ranger
    tmux

    xsel

  ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.git = {
      withManual = true;
  };

}

