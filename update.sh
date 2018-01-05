#!/bin/sh
sudo nix-channel --update && $(dirname $0)/build.sh $*
