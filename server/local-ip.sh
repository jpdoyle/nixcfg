ifconfig |  grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' |  grep -Eo '([0-9]*\.){3}[0-9]*' |  grep -v '127.0.0.1' >/home/joe/Sync/ip/local-$(hostname)-$(date +%b_%d_%Y_%H_%M_%S)
