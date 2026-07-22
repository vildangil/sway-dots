# SwayFX Dots

## Тема
Тёмная фиолетовая тема под wallpaper.jpg.

## Установка

### Зависимости
```
sudo pacman -S swayfx-git waybar wofi kitty alacritty polkit-gnome playerctl
yay -S otf-apple-sf-pro otf-apple-sf-mono
```

### Копирование
```bash
# SwayFX
cp sway/config ~/.config/sway/config

# Waybar
cp waybar/config ~/.config/waybar/config
cp waybar/style.css ~/.config/waybar/style.css

# Скрипты Waybar
cp scripts/*.sh ~/.config/waybar/scripts/
chmod +x ~/.config/waybar/scripts/*.sh

# Kitty
cp kitty/kitty.conf ~/.config/kitty/kitty.conf

# Wofi
cp wofi/style.css ~/.config/wofi/style.css

# Обои
cp wallpaper.jpg ~/Wallpaper/wallpaper.jpg
```

### Настройки мониторов
В `~/.config/sway/config` поправьте строки:
```
output DP-1 resolution 1920x1080@144.001Hz
output HDMI-A-1 resolution 1920x1080
focus output DP-1
workspace 1 output DP-1
workspace 2 output HDMI-A-1
```

## Сочетания клавиш

### Запуск приложений
| Клавиша | Действие |
|---------|----------|
| Win+Return | Терминал (Kitty) |
| Win+B | Firefox |
| Win+T | Telegram |
| Win+E | Dolphin |
| Win+R | Wofi (launcher) |

### Управление окнами
| Клавиша | Действие |
|---------|----------|
| Win+Q | Закрыть окно |
| Win+F | Полный экран |
| Win+Shift+Space | Плавающий режим |
| Win+S | Stacking layout |
| Win+W | Tabbed layout |
| Win+Shift+R | Режим изменения размера |
| Win+←↑→↓ | Фокус на окно |
| Win+Shift+←↑→↓ | Переместить окно в раскладке |

### Workspaces
| Клавиша | Действие |
|---------|----------|
| Win+1..0 | Переключить workspace |
| Win+Shift+1..0 | Переместить окно на workspace |
| Ctrl+Shift+1..0 | Переместить окно на другой монитор |
| Ctrl+Scroll | Следующий/предыдущий workspace |

### Скриншоты
| Клавиша | Действие |
|---------|----------|
| Print | Скриншот всего экрана → буфер |
| Win+Print | Скриншот области → буфер |
| Ctrl+Shift+Print | Скриншот области (drag mode) → буфер |

### Система
| Клавиша | Действие |
|---------|----------|
| Win+Shift+C | Перезагрузить конфиг |
| Win+Shift+E | Выйти из Sway |
| XF86AudioRaiseVolume | Громкость +5% |
| XF86AudioLowerVolume | Громкость -5% |
| XF86AudioMute | Mute |

### Перетаскивание окон
- Win+Shift+Space — сделать окно плавающим
- Win+левый клик по краю — таскать
- Win+правый клик по краю — изменить размер

## Waybar модули
- **Слева**: workspaces, mode, название трека, название окна
- **Центр**: дата, погода (wttr.in/Nizhnekamsk)
- **Справа**: системный трей, раскладка (US/RU), аудиовыход, pulseaudio, память, CPU, питание

## Скриншоты
`grim - | wl-copy` — скриншот в буфер обмена
`grim -g "$(slurp -d)" - | wl-copy` — скриншот области
