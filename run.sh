#!/bin/sh

cp ~/.bashrc .
cp ~/.tmux.conf .
cp ~/.vimrc .
cp ~/.xinitrc .
cp ~/.Xresources .

[[ ! -d "bin" ]] && mkdir bin
cp ~/bin/*.sh bin/

[[ ! -d ".config" ]] && mkdir .config

[[ ! -d ".config/alacritty" ]] && mkdir .config/alacritty
cp ~/.config/alacritty/alacritty.yml .config/alacritty/

[[ ! -d ".config/conky" ]] && mkdir .config/conky
cp ~/.config/conky/conky.conf .config/conky/

[[ ! -d ".config/fish" ]] && mkdir .config/fish
[[ ! -d ".config/fish/functions" ]] && mkdir .config/fish/functions
cp ~/.config/fish/config.fish .config/fish/
cp ~/.config/fish/functions/* .config/fish/functions/

[[ ! -d ".config/spectrwm" ]] && mkdir .config/spectrwm
cp ~/.config/spectrwm/spectrwm.conf .config/spectrwm/

[[ ! -d "dwm" ]] && mkdir dwm
cp ~/projects/dwm-6.2/config.h dwm/
cp ~/projects/dwm-6.2/config.mk dwm/
cp ~/projects/dwm-6.2/dwm-setstatus.c dwm/
cp ~/projects/dwm-6.2/dwm.patch dwm/

[[ ! -d ".config/i3" ]] && mkdir .config/i3
cp ~/.config/i3/config .config/i3/

[[ ! -d ".config/i3status" ]] && mkdir .config/i3status
cp ~/.config/i3status/config .config/i3status/
cp ~/.config/i3status/wrapper.py .config/i3status/

[[ ! -d ".config/picom" ]] && mkdir .config/picom
cp ~/.config/picom/picom.conf .config/picom/

[[ ! -d ".config/rofi" ]] && mkdir .config/rofi
cp ~/.config/rofi/*.rasi .config/rofi/

[[ ! -d ".config/qlstatus" ]] && mkdir .config/qlstatus
cp ~/.config/qlstatus/qlstatus.conf .config/qlstatus/

[[ ! -d ".config/redshift" ]] && mkdir .config/redshift
cp ~/.config/redshift/redshift.conf .config/redshift/

[[ ! -d ".config/terminator" ]] && mkdir .config/terminator
cp ~/.config/terminator/config .config/terminator/

[[ ! -d ".config/dunst" ]] && mkdir .config/dunst
cp ~/.config/dunst/dunstrc .config/dunst/

[[ ! -d "xorg" ]] && mkdir xorg
cp /etc/X11/xorg.conf.d/*.conf xorg/
