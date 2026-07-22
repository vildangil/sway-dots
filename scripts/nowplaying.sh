#!/bin/bash
info=$(playerctl metadata --format "{{artist}} - {{title}}" 2>/dev/null)
if [ -n "$info" ]; then
    if [ ${#info} -gt 40 ]; then
        echo "${info:0:37}..."
    else
        echo "$info"
    fi
else
    echo ""
fi
