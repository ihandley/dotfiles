#!/usr/bin/env bash

(
    echo foo # Run in a subshell so it won't crash current color settings 
    gdircolors -b >/dev/null
    IFS=:
    for ls_color in ${LS_COLORS[@]}; do # For all colors
        color=${ls_color##*=}
        ext=${ls_color%%=*}
        echo -en "\E[${color}m${ext}\E[0m " # echo color and extension
    done
    echo
)
