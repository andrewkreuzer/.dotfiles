#. /home/akreuzer/.config/screenlayout/default.sh
# default to bspwm
session=${1:-bspwm}

case $session in
    bspwm             ) exec bspwm;;
    openbox           ) exec openbox-session;;
    xfce|xfce4        ) exec startxfce4;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac

#wal -R
# vim: ft=sh
