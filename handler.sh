#!/bin/bash

# Default acpi script that takes an entry for all actions 
# echo "$1" >>/var/log/acpi_events
# echo "$2" >>/var/log/acpi_events

logger() {
    echo "$*" >>/var/log/acpi_events
}

logger $*

getXuser() {
        user=`finger| grep -m1 ":$displaynum " | awk '{print $1}'`
        if [ x"$user" = x"" ]; then
            user=`ps aux | grep 'Xorg' | grep -v grep | \
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

findX() {
    for x in /tmp/.X11-unix/*; do
        displaynum=`echo $x | sed s:/tmp/.X11-unix/X::`
        getXuser;
        if [ x"$XAUTHORITY" != x"" ]; then
            export DISPLAY=":$displaynum"        
        fi
        export user
        export XAUTHORITY
    done
}

runSuspend() {
    findX;
    for x in /tmp/.X11-unix/*;do
        getXUser
        displaynum=`echo $x | sed 's:/tmp/.X11-unix/X::'`
        echo "Lock screen for $user on display $displaynum" >>/tmp/acpi-log
        su $user -c "DISPLAY=:$displaynum xscreensaver-command -lock" &>>/tmp/acpi-log
    done
    sleep 0.001s
    (acpi | grep 'Discharging' >/dev/null) && systemctl suspend
}

case "$1" in
    button/power)
        case "$2" in
            PBTN|PWRF)
                logger 'PowerButton pressed'
                /usr/local/bin/shutdown-click
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SLPB|SBTN)
                logger 'SleepButton pressed'
                runSuspend
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        logger 'AC unpluged'
                        ;;
                    00000001)
                        logger 'AC pluged'
                        ;;
                esac
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)
                        logger 'Battery online'
                        ;;
                    00000001)
                        logger 'Battery offline'
                        ;;
                esac
                ;;
            CPU0)
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;

    button/lid)
        case "$3" in
            close)
                logger 'LID closed'
                runSuspend
                ;;
            open)
                logger 'LID opened'
                ;;
            *)
                logger "ACPI action undefined: $3"
                ;;

    esac
    ;;
    # PNP0C14:00)
    #     logger "Trackpad toggle"
    #     DISPLAY=:0 /usr/local/bin/toggle-trackpad &>>/var/log/acpi_events
    #     echo $? >>/var/log/acpi_events
    # ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac

# vim:set ts=4 sw=4 ft=sh et:
