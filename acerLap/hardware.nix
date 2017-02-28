{ config, lib, pkgs, ... }:

{
    imports =
        [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
        ];


    # Use the GRUB 2 boot loader.
    boot.loader.grub.enable = true;
    boot.loader.grub.version = 2;

    # Define on which hard drive you want to install Grub.
    boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
    boot.loader.grub.enableCryptodisk = true;

    boot.loader.grub.extraEntries = ''
        menuentry "Windows 7" {
            chainloader (hd0,1)+1
        }
    '';

    powerManagement.cpuFreqGovernor = "ondemand";

    boot.initrd.availableKernelModules = [
        "xhci_pci" "ehci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"
        "sdhci_acpi" "sr_mod" "rtsx_pci_sdmmc"
    ];
    boot.kernelModules = [ "kvm-intel" "fbcon" "snd-seq" "snd-rawmidi"
        "tun" "virtio" "fuse" "afs"
    ];
    boot.extraModulePackages = [ ];

    boot.initrd.luks.devices = [
    { name = "lvm"; device = "/dev/disk/by-uuid/fd295df1-a4fa-4499-a958-efd902b59248"; preLVM = true; }
    ];

    fileSystems."/" = {
        device = "/dev/mapper/luksroot-root";
        fsType = "ext4";
    };

    fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/6a63cc36-525f-4af6-96c5-438da00257c3";
        fsType = "ext4";
    };

    swapDevices =
    [ { device = "/dev/mapper/luksroot-swap"; }
    ];

    nix.maxJobs = 8;
}
