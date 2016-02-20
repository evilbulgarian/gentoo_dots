#!/bin/bash
## information bar

## colors and  fonts
. /usr/local/bin/barconf

## glyphs
  glymem=""
  glycpu=""
  glytemp=""
  glypkg=""
  glyclock=""
  glycal=""
## extras
  SEP=" "
  SEP2="  "
  SEP3="   "
  SEP4="    "
  SEP6="       "
  SEP8="        "
## information section
status() {
    cpuld() {
        cpuload=$(cpu)
        echo %{F$CYN}$glycpu$SEP$cpuload%{F-}
    }

    memory() {
        mem=$(free -m | awk 'NR==2 {print $3}')
        mem+="MB"
        echo %{F$RED}$glymem$SEP$mem%{F-}
    }

    overclock() {
        temp=$((`sensors | grep "Physical id 0" | cut -d'+' -f2 | head -c2`))
        echo %{F$YLW}$glytemp$SEP$temp°%{F-}
    }

	pkgupdates() {
		pkgu=$(cat /tmp/current_updates.output)
		echo %{F$BLU}$glypkg$SEP$pkgu%{F-}
	}

    vol() {
        vlm=$(pamixer --get-volume)
        glyvol=""
        echo %{F$MAG}$glyvol$SEP$vlm$SEP%{F-}
    }

	clockdate() {
	    clockd=%{F$GRN}$glycal$(date +%{F$GRN}' %d   %b')%{F-}
        clockt=%{F$CYN}$glyclock$(date +' %R')%{F-}
        echo $clockd
    }

    clocktime() {
        clockt=%{F$CYN}$glyclock$(date +' %R')%{F-}
        echo $clockt
    }
    echo "%{c}$SEP4$(cpuld)$SEP4$(memory)$SEP4$(overclock)$SEP4$(pkgupdates)$SEP4$(vol)$SEP3$(clockdate)$SEP4$(clocktime)$SEP4"
}

pamixer --get-volume # resolves no text at start bug
while true
do
  echo "$(status)"
  sleep 2
done | lemonbar -g $notifybar_g -d -f "terminus12-8" -f "FontAwesome:size=8" -B $BG -F $WHT
