
export PATH="$PATH:/run/current-system/sw/bin/"

debug=false
function log() {
    $debug && echo $* >>/tmp/acpi-log
}
log "$(date): trying suspend"

function getXuser() {
        user=`finger| grep -m1 ":$displaynum " | awk '{print $1}'`
        if [ x"$user" = x"" ]; then
            user=`ps aux | grep 'X' | grep -v grep | \
                           grep -m1 ":$displaynum" | awk '{print $1}'`
        fi
        export user
        if [ x"$user" != x"" ]; then
                userhome=`getent passwd $user | cut -d: -f6`
                export XAUTHORITY=$userhome/.Xauthority
        else
                export XAUTHORITY=""
        fi
}

function findX() {
    for x in /tmp/.X11-unix/*; do
        displaynum=`echo $x | sed s:/tmp/.X11-unix/X::`
        # getXuser;
        if [ x"$XAUTHORITY" != x"" ]; then
            export DISPLAY=":$displaynum"        
        fi
        # export user
        export XAUTHORITY
    done
}

runSuspend() {
    # findX;
    for x in /tmp/.X11-unix/*;do
        # users=$(ps aux | grep xscreensaver | grep -v grep |
        #         awk '{print $1}')
        for user in `who | awk '{print $1}'`; do
            displaynum=`echo $x | sed 's:/tmp/.X11-unix/X::'`
            log "Lock screen for $user on display $displaynum"
            su $user -c "DISPLAY=:$displaynum.0 (xscreensaver-command -watch | (while read x; do echo $x; if [[ -n $(echo $x | grep 'RUN') ]]; then break; fi; done)" & # &>>/tmp/acpi-log
            if ! (ps aux | grep $user | grep -v grep | grep xscreensaver); then
                su $user -c "DISPLAY=:$displaynum.0 xscreensaver & disown"
                sleep 0.1s
            fi
            su $user -c "DISPLAY=:$displaynum.0 xscreensaver-command -lock" # &>>/tmp/acpi-log
            wait
        done
    done
    #sleep 0.001s
    (acpi | grep 'Discharging' >/dev/null) && systemctl suspend
}

runSuspend >>/tmp/acpi-log 2>&1

