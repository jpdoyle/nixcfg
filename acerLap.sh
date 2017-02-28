#!/bin/sh
export NIXOS_CONFIG=`pwd`/acerLap.nix

exec ./build.sh $*

