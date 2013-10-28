#!/bin/bash
echo "<img>/usr/share/icons/gnome/16x16/apps/gnome-monitor.png</img>"
allfreq() { cat /proc/cpuinfo | grep "cpu MHz" | sed 's/\ \ */ /g' | cut -f3 -d" " | cut -f1 -d"." ; }

declare -i maxfreq
maxfreq=$(allfreq | sort | head -n1)
humanfreq() {
    local intfreq=$1
    if [ $intfreq -ge 1000 ]
    then
      echo $(echo $intfreq | cut -c1).$(echo $intfreq | cut -c2)GHz
    else
      echo ${intfreq}MHz
    fi
}


temperature() {
    sensors | grep temp1 | sed -e 's/temp1:\s\+[+-]\([^[:space:]]\+\)\+\s.*/\1/' | sort -n | tail -n1
}


sensors_installed() { type sensors >/dev/null 2>&1 ; }

echo  -n "<txt>"
sensors_installed && echo -en " $(temperature)\n"
echo " $(humanfreq $maxfreq)</txt>"

echo -en "<tool>"
sensors_installed && sensors
i=0; allfreq | while read freq; do test $i -gt 0 && echo; echo -en "CPU $i: $(humanfreq $freq)"; i=$(expr $i + 1); done 
echo "</tool>"
