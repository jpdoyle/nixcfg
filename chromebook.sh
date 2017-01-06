#!/bin/bash
export NIXOS_CONFIG=`pwd`/chromebook.nix

exec ./build.sh

