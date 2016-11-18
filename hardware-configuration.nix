# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [
    "xhci_pci" "usb_storage" "usbhid" "sd_mod" "sdhci_acpi"
  ];
  # boot.kernelPackages = pkgs.linuxPackages_chromiumos_3_18;
  boot.kernelModules = [ "kvm-intel" "fbcon" "snd-seq" "snd-rawmidi" "tun" "virtio" ];
  system.requiredKernelConfig = with config.lib.kernelConfig; [
    (isYes "CHROME_PLATFORMS")
  ];
  boot.extraModulePackages = [ ];
  boot.extraModprobeConfig = ''
    options snd_hda_intel index=0 model=alc283-sense-combo
  '';

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true; # This might be needed for Steam games
    systemWide = true;
    package = pkgs.pulseaudioFull;
#    extraClientConf = ''
#    load-module module-alsa-sink device=sysdefault
#    '';
  };

  sound.enable = true;

  boot.initrd.luks.devices = [
    { name = "lvm"; device = "/dev/mmcblk0p2"; preLVM = true; }
  ];

  fileSystems."/".device = "/dev/mapper/vg-root";

  fileSystems."/boot" =
    { device = "/dev/mmcblk0p1";
      fsType = "ext4";
    };

  swapDevices = [ { device = "/dev/mapper/vg-swap"; } ];

  nix.maxJobs = lib.mkDefault 2;
}
