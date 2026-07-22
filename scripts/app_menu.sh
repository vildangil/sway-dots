#!/bin/bash
app="$1"
action="$2"

desktop_file=""
for dir in /usr/share/applications ~/.local/share/applications; do
    for f in "$dir/$app.desktop" "$dir/org.$app.desktop" "$dir/org.$app."*.desktop; do
        [ -f "$f" ] && desktop_file="$f" && break 2
    done
done

if [ -z "$desktop_file" ]; then
    case "$app" in
        telegram) desktop_file="/usr/share/applications/org.telegram.desktop.desktop" ;;
        steam) desktop_file="/usr/share/applications/steam.desktop" ;;
        firefox) desktop_file="/usr/share/applications/firefox.desktop" ;;
        code) desktop_file="/usr/share/applications/code.desktop" ;;
    esac
fi

[ -z "$desktop_file" ] && { notify-send "Error" "No desktop file for $app"; exit 1; }
[ ! -f "$desktop_file" ] && { notify-send "Error" "Desktop file not found: $desktop_file"; exit 1; }

if [ -z "$action" ]; then
    actions=$(python3 -c "
import configparser, sys
c = configparser.ConfigParser()
c.read('$desktop_file')
res = []
for s in c.sections():
    if s.startswith('Desktop Action '):
        name = c[s].get('Name', s.replace('Desktop Action ', ''))
        exec_cmd = c[s].get('Exec', '')
        res.append((name, exec_cmd))
if res:
    for n, e in res:
        print(f'{n}|{e}')
" 2>/dev/null)

    if [ -n "$actions" ]; then
        choice=$(echo "$actions" | awk -F'|' '{print $1}' | wofi --dmenu --prompt "$app" --hide-search --width 250 --lines 8)
        [ -z "$choice" ] && exit
        exec_line=$(echo "$actions" | awk -F"|" -v c="$choice" '$1 == c {print $2}')
        [ -n "$exec_line" ] && eval "$exec_line" &
    fi
    exit
fi

case "$action" in
    open) exec "$app" ;;
esac
