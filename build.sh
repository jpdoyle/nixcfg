#!/bin/sh

bashloc=`which bash`

[[ -z $bashloc ]] && exit 1

[[ -z "$bashrunning" ]] && bashrunning="yes" exec $bashloc $0 $*

flag=$1
if [[ -z $flag ]]; then
    flag="switch"
else
    shift
fi

if [[ -z $NIXOS_CONFIG ]]; then
    if [[ -e /nixos-build ]]; then
        export NIXOS_CONFIG=$(tail -n 1 /nixos-build | cut -d' ' -f 2)
    else
        export NIXOS_CONFIG=`pwd`/configuration.nix
    fi
else
    export NIXOS_CONFIG
fi
echo "nix config: $NIXOS_CONFIG"
echo "exec sudo -E nixos-rebuild $flag $*"
sudo -E bash -c 'echo "$(date "+%Y-%m-%d-%H-%M-%S") $NIXOS_CONFIG" >>/nixos-build'
exec sudo -E nixos-rebuild $flag $*
