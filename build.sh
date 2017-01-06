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

[[ -n $NIXOS_CONFIG ]] || export NIXOS_CONFIG=`pwd`/configuration.nix
echo "exec sudo -E nixos-rebuild $flag $*"
exec sudo -E nixos-rebuild $flag $*
