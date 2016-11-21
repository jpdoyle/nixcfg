#!/bin/sh

bashloc=`which bash`

[[ -z $bashloc ]] && exit 1

[[ -z "$bashrunning" ]] && bashrunning="yes" exec $bashloc $0

flag=$1
[[ -z $flag ]] && flag="switch"

export NIXOS_CONFIG=`pwd`/configuration.nix
exec sudo -E nixos-rebuild $flag
