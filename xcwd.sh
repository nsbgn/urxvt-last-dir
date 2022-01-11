#!/bin/sh

# Returns the current working directory of the focused terminal window. Works
# for urxvtc.
# Inspired by:
# - https://github.com/wknapik/lastcwd
# - https://gist.github.com/viking/5851049

if id=$(xdotool getactivewindow); then
    readlink /proc/$(ps e -o tpgid=,pid=,args= \
    | grep -m 1 WINDOWID=$id | tr -s ' ' | cut -f2 -d' ')/cwd
else
    echo $HOME
fi
