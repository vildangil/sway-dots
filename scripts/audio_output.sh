#!/bin/bash
case "$1" in
    next)
        current=$(pactl get-default-sink)
        mapfile -t sinks < <(pactl list short sinks | awk '{print $2}')
        for i in "${!sinks[@]}"; do
            if [ "${sinks[$i]}" = "$current" ]; then
                next=$(( (i + 1) % ${#sinks[@]} ))
                pactl set-default-sink "${sinks[$next]}"
                break
            fi
        done
        ;;
    prev)
        current=$(pactl get-default-sink)
        mapfile -t sinks < <(pactl list short sinks | awk '{print $2}')
        for i in "${!sinks[@]}"; do
            if [ "${sinks[$i]}" = "$current" ]; then
                prev=$(( (i - 1 + ${#sinks[@]}) % ${#sinks[@]} ))
                pactl set-default-sink "${sinks[$prev]}"
                break
            fi
        done
        ;;
    list)
        notify-send "Audio Outputs" "$(pactl list sinks | grep -E 'Name:|Description:' | paste - - | sed 's/Name: //;s/[[:space:]]*Description: /\n  /g')"
        ;;
    *)
        current=$(pactl get-default-sink)
        desc=$(pactl list sinks | grep -A 10 "Name: $current" | grep Description | head -1 | cut -d: -f2- | xargs)
        case "$desc" in
            *HDMI*) echo "HDMI" ;;
            *fifine*|*Microphone*) echo "USB" ;;
            *analog*|*наушники*|*Наушники*) echo "" ;;
            *) echo "${desc:0:10}" ;;
        esac
        ;;
esac
