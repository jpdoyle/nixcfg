#/bin/sh
ifconfig |  grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' |  grep -Eo '([0-9]*\.){3}[0-9]*' |  grep -v '127.0.0.1' >~/Sync/ip/local-$(hostname)-$(date +%b_%d_%Y_%H_%M_%S)

# nix-shell '<nixpkgs>' -A bind --command "dig +short myip.opendns.com @resolver1.opendns.com >~/Sync/ip/global-$(hostname)-$(date +%b_%d_%Y_%H_%M_%S)"
dig +short myip.opendns.com @resolver1.opendns.com >~/Sync/ip/global-$(hostname)-$(date +%b_%d_%Y_%H_%M_%S)

