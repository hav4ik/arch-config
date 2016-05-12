#! /bin/bash

# Set wallpaper
feh --bg-scale /home/falcon/Images/Wallpapers/onion-flower.jpg

setxkbmap -option terminate:ctrl_alt_bksp
xset +fp /home/falcon/.dwm/fonts
xset fp rehash
xbindkeys &

# Set some defaults
export BROWSER=firefox &
export EDITOR=vim &

# Set ibus configurations
export GTK_IM_MODULE=ibus &
export XMODIFIERS=@im=ibus &
export QT_IM_MODULE=ibus &
ibus-daemon -drx &

# start offlineimap loop to synchronize with gmail
offlineimap & 

cpu_used=0
cpu_idle_old=0
cpu_total_old=0
feedback=0

conky | while read -r
do
	xsetroot -name "$REPLY   $(date +"%a %d %b  %R") "
done &

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources 
mpd

setxkbmap -layout "us,ru(winkeys),ua(winkeys)" -option "grp:atl_shift_toggle" &
exec dwm
