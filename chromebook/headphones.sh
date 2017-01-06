export PATH="$PATH:/run/current-system/sw/bin/"
speaker="on"
headphoneState="off"
if $headphones; then
    speaker="off"
    headphoneState="on"
fi
amixer -c 1 sset 'Speaker Left',0    $speaker
amixer -c 1 sset 'Speaker Right',0   $speaker
amixer -c 1 sset 'Headphone Left',0  $headphoneState
amixer -c 1 sset 'Headphone Right',0 $headphoneState
