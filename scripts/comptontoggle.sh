#!/bin/bash

CMPFILE=${CMPFILE:-/tmp/cmpFile}

if [ -e $CMPFILE ]; then
    compton -b --config /usr/local/bin/compton.conf
    bgc
    popup ":: compton enabled ::" 2 &
    rm $CMPFILE
else
    echo $ "dummytext" >> $CMPFILE
    ps -ef | grep "compton -b" | grep -v grep | awk '{print $2}' | xargs kill
    popup ":: compton disabled ::" 2 &
fi


