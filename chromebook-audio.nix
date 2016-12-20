{ config, lib, pkgs, ... }:

{
    system.activationScripts.asound = ''
    mkdir -p /var/lib/alsa;
    cat >/var/lib/alsa/asound.state <<EOF
    '' + builtins.readFile ./asound.state + ''
EOF
    '';
}

