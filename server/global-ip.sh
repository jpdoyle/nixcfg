nix-shell "<nixpkgs>" -A bind --command "dig +short myip.opendns.com @resolver1.opendns.com >/home/joe/Sync/ip/global-$(hostname)-$(date +%b_%d_%Y_%H_%M_%S)" 
