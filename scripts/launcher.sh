#!/bin/bash
case "$1" in
    firefox) exec firefox ;;
    telegram) exec Telegram ;;
    dolphin) exec dolphin ;;
    terminal) exec kitty ;;
    *) echo "" ;;
esac
