#!/bin/bash
case "$1" in
    menu)
        choice=$(printf " Выключить\n Перезагрузить\n Выйти" | wofi --dmenu --prompt "" --hide-search --width 200 --lines 3)
        case "$choice" in
            *Выключить*) systemctl poweroff ;;
            *Перезагрузить*) systemctl reboot ;;
            *Выйти*) swaymsg exit ;;
        esac
        ;;
    *)
        echo "⏻"
        ;;
esac
