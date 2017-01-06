{ config, lib, pkgs, ... }:

{
    imports =
        [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
        ];


    # Use the GRUB 2 boot loader.
    boot.loader.grub.enable = true;
    boot.loader.grub.version = 2;

    # Define on which hard drive you want to install Grub.
    boot.loader.grub.device = "/dev/mmcblk0"; # or "nodev" for efi only
        boot.loader.grub.enableCryptodisk = true;

    powerManagement.cpuFreqGovernor = "ondemand";

    boot.initrd.availableKernelModules = [
        "xhci_pci" "usb_storage" "usbhid" "sd_mod" "sdhci_acpi"
    ];
    boot.kernelModules = [ "kvm-intel" "fbcon" "snd-seq" "snd-rawmidi"
        "tun" "virtio" "fuse"
    ];
    boot.extraModulePackages = [ ];
    boot.extraModprobeConfig = ''
        options snd_hda_intel index=0 model=,alc283-chrome
        '';

    boot.initrd.luks.devices = [
    { name = "lvm"; device = "/dev/mmcblk0p2"; preLVM = true; }
    ];
    systemd.services.mountSD =
        let sdPath = "/dev/disk/by-uuid/bcedbd17-190f-4977-81f3-4b9e8dcb906b";
    in
    {
        enable = true;
        description = "Remount encrypted SD card";
        restartTriggers = [ sdPath ];
        script = ''
            while ! [[ -e ${sdPath} ]]; do sleep 1; done
            mkdir -p /run/media/sd
            ls /dev >/root/devices
            args="--key-file /root/keyfile ${sdPath} sd"
            args="$args --verbose --debug"
            ${pkgs.cryptsetup}/bin/cryptsetup luksOpen $args
            ${pkgs.utillinux}/bin/mount -o defaults /dev/mapper/sd /run/media/sd
            ${pkgs.coreutils}/bin/chown -R :wheel /run/media/sd
            ${pkgs.coreutils}/bin/chmod -R g=u /run/media/sd
            while [[ -e ${sdPath} ]]; do sleep 1; done
        '';

        preStop = ''
            ${pkgs.coreutils}/bin/sync || true
            ${pkgs.utillinux}/bin/umount /run/media/sd || true
            ${pkgs.cryptsetup}/bin/cryptsetup close sd || true
            rm -d /run/media/sd  || true
            '';
        serviceConfig = {
            Restart = "always";
        };
        wantedBy = [ "multi-user.target" ];
        after = [ "systemd-udev-settle.service" ];
    };

    fileSystems."/".device = "/dev/mapper/vg-root";

    fileSystems."/boot" =
    { device = "/dev/mmcblk0p1";
        fsType = "ext4";
    };

    nix.maxJobs = lib.mkDefault 2;
}
