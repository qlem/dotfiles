#!/bin/sh

dir=$HOSTNAME
dir_bin="$dir/bin"
dir_config="$dir/.config"
dir_local="$dir/.local"
dir_dwm="$dir/dwm"
dir_xorg="$dir/xorg"

[[ ! -d $dir ]] && mkdir $dir

# files in home
cp ~/.bashrc "$dir/"
cp ~/.tmux.conf "$dir/"
cp ~/.vimrc "$dir/"
cp ~/.xinitrc "$dir/"
cp ~/.Xresources "$dir/"

# script files
[[ ! -d $dir_bin ]] && mkdir $dir_bin
cp ~/bin/*.sh "$dir_bin/"

# -- config files --
[[ ! -d $dir_config ]] && mkdir $dir_config

# alacritty
[[ ! -d "$dir_config/alacritty" ]] && mkdir "$dir_config/alacritty"
cp ~/.config/alacritty/alacritty.yml "$dir_config/alacritty/"

# conky
[[ ! -d "$dir_config/conky" ]] && mkdir "$dir_config/conky"
cp ~/.config/conky/conky.conf "$dir_config/conky/"

# fish
[[ ! -d "$dir_config/fish" ]] && mkdir "$dir_config/fish"
[[ ! -d "$dir_config/fish/functions" ]] && mkdir "$dir_config/fish/functions"
cp ~/.config/fish/config.fish "$dir_config/fish/"
cp ~/.config/fish/functions/* "$dir_config/fish/functions/"

# spectrwm
[[ ! -d "$dir_config/spectrwm" ]] && mkdir "$dir_config/spectrwm"
cp ~/.config/spectrwm/spectrwm.conf "$dir_config/spectrwm/"

# i3
[[ ! -d "$dir_config/i3" ]] && mkdir "$dir_config/i3"
cp ~/.config/i3/config "$dir_config/i3/"

# i3status
[[ ! -d "$dir_config/i3status" ]] && mkdir "$dir_config/i3status"
cp ~/.config/i3status/config "$dir_config/i3status/"
cp ~/.config/i3status/wrapper.py "$dir_config/i3status/"

# picom
[[ ! -d "$dir_config/picom" ]] && mkdir "$dir_config/picom"
cp ~/.config/picom/picom.conf "$dir_config/picom/"

# rofi
[[ ! -d "$dir_config/rofi" ]] && mkdir "$dir_config/rofi"
cp ~/.config/rofi/*.rasi "$dir_config/rofi/"

# qlstatus
[[ ! -d "$dir_config/qlstatus" ]] && mkdir "$dir_config/qlstatus"
cp ~/.config/qlstatus/qlstatus.conf "$dir_config/qlstatus/"

# redshift
[[ ! -d "$dir_config/redshift" ]] && mkdir "$dir_config/redshift"
cp ~/.config/redshift/redshift.conf "$dir_config/redshift/"

# terminator
[[ ! -d "$dir_config/terminator" ]] && mkdir "$dir_config/terminator"
cp ~/.config/terminator/config "$dir_config/terminator/"

# dunst
[[ ! -d "$dir_config/dunst" ]] && mkdir "$dir_config/dunst"
cp ~/.config/dunst/dunstrc "$dir_config/dunst/"

# xorg conf files
[[ ! -d $dir_xorg ]] && mkdir $dir_xorg
cp /etc/X11/xorg.conf.d/*.conf "$dir_xorg/"

# dwm files
[[ ! -d $dir_dwm ]] && mkdir $dir_dwm
cp ~/projects/dwm-6.2/config.h "$dir_dwm/"
cp ~/projects/dwm-6.2/config.mk "$dir_dwm/"
cp ~/projects/dwm-6.2/dwm-setstatus.c "$dir_dwm/"
cp ~/projects/dwm-6.2/dwm.patch "$dir_dwm/"

# custom hhkb keyboard layout
[[ ! -d "$dir_local/share/xkb" ]] && mkdir -p "$dir_local/share/xkb"
cp ~/.local/share/xkb/hhkb-custom-layout.xkb "$dir_local/share/xkb/"
cp /etc/udev/rules.d/99-keyboard.rules "$dir/"
