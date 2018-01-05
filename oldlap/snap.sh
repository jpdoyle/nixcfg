#/bin/sh
pushd /home/joe
# nix-shell -p mplayer --command 'bash -c "mplayer -vo jpeg -frames 1 tv://; cp 00000001.jpg /home/joe/Sync/cam/$(date +%b_%d_%Y_%H_%M_%S).jpg"'
mplayer -vo jpeg -frames 1 tv://; cp 00000001.jpg /home/joe/Sync/cam/$(date +%b_%d_%Y_%H_%M_%S).jpg
popd
