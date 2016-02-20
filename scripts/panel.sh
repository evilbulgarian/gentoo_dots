#!/bin/sh
#
# Collect information about the system and pipe it to lemonbar.
# NOTE: This script is tailored to a specific system and will most likely
#       need some tinkering to work for another system. I added some instructions
#       (comments starting with #-) that you can follow in order to adjust it to your needs.
#

#- The command for lemonbar. Adjust back- and foreground colors, Fonts and
#- underline thinckness, as well as the geometry of the window here.
#- Also, feel free to add other flags here.
lemonbar_command='lemonbar -f "terminus12:size=8" '\
'-f "FontAwesome:size=10" '\
'-u 2 '\
'-B \#20292d '\
'-F \#60867f '\
'-g 196x30+1622+1391'

# lemonbar sepecific
left() {
    echo -ne "%{l} ${@}%{l}"
}

# data collecting functions...

#- I'm not exactly sure if this will work on your system, but I guess it will.
desktops() {
    current=$(bspc query -D -d)
    all=$(bspc query -D | tr '\n' ' ')
    echo -ne " ${all} " |
        sed 's/ /    /g' |
        sed 's/ '${current}' /%{!u}%{F#c4c4b5} '${current}' %{F-}%{!u}/' |
        sed 's/^  //'

}

# main loop
while true; do
    #- Adjust the underline color?
    echo -ne '%{U#ac8d6e}'
    
    #- Here you can change the order of the bar or add things to it.
    left "$(desktops)"
    echo # eol
    
    sleep 0.2s #- Adjust sleep duration if you want.
done | eval "${lemonbar_command}"
