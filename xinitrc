#!/bin/sh

urxvtd -q -o -f &
xcalib -gc 1.08 -co 97 /home/whoami/x230.icm &
xsetroot -name background # Set 'Root' Window.
xsetroot -cursor_name left_ptr # Name your pet cursor!

xset +fp ~/.fonts
xset fp rehash
xset -dpms

xrdb -load ~/.Xresources

compton -b --config /usr/local/bin/compton.conf
statsbar.sh &
panel.sh &
ckb --background &
unclutter &
exec bspwm
