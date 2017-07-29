#!/bin/sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export PATH="$HOME/.local/bin:$PATH"

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Use HiDPI in GTK3 apps
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# Use QT Settings
export QT_QPA_PLATFORMTHEME="qt5ct"

# disable sleeping, beeping, and blanking
xset -dpms -b -s

# load .Xresources
xrdb -merge $HOME/.Xresources

# enable restart X, caps as ctrl, and right alt for compose key
setxkbmap -option compose:ralt,ctrl:nocaps,terminate:ctrl_alt_bksp

# set wallpaper
# setroot --restore 2>/dev/null
# set cursor
#xsetroot -cursor_name left_ptr &
#compton &
#dunst &
nextcloud &
exec i3
