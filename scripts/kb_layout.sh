#!/bin/bash
swaymsg -t get_inputs | python3 -c "
import json, sys
data = json.load(sys.stdin)
for d in data:
    if 'xkb_active_layout_name' in d and d['type'] == 'keyboard' and 'Power_Button' not in d['identifier'] and 'Consumer_Control' not in d['identifier'] and 'System_Control' not in d['identifier']:
        layout = d['xkb_active_layout_name']
        if layout == 'Russian':
            print('RU')
        elif layout == 'English (US)':
            print('US')
        else:
            print(layout[:2].upper())
        break
"
