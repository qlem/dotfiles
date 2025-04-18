#!/bin/sh

dir=$HOSTNAME
dir_bin="$dir/bin"
dir_config="$dir/config"
dir_xorg="$dir/xorg"

[[ ! -d $dir ]] && mkdir $dir

# -- home files --
cp ~/.bashrc "$dir/"
cp ~/.vimrc "$dir/"
cp ~/.xinitrc "$dir/"
cp ~/.Xresources "$dir/"
cp ~/.Xkeymap "$dir/"

# -- script files --
[[ ! -d $dir_bin ]] && mkdir $dir_bin
cp ~/.local/bin/*.sh "$dir_bin/"

# custom hhkb keyboard layout
cp ~/.local/share/xkb/hhkb-custom-layout.xkb "$dir/"
cp /etc/udev/rules.d/99-keyboard.rules "$dir/"

# -- xorg files --
[[ ! -d $dir_xorg ]] && mkdir $dir_xorg
cp /etc/X11/xorg.conf.d/*.conf "$dir_xorg/"

# -- config files --
[[ ! -d $dir_config ]] && mkdir $dir_config

# alacritty
[[ ! -d "$dir_config/alacritty" ]] && mkdir "$dir_config/alacritty"
cp ~/.config/alacritty/alacritty.yml "$dir_config/alacritty/"
cp ~/.config/alacritty/alacritty.toml "$dir_config/alacritty/"

# clangd
[[ ! -d "$dir_config/clangd" ]] && mkdir "$dir_config/clangd"
cp ~/.config/clangd/config.yaml "$dir_config/clangd/"

# conky
[[ ! -d "$dir_config/conky" ]] && mkdir "$dir_config/conky"
cp ~/.config/conky/conky.conf "$dir_config/conky/"

# dunst
[[ ! -d "$dir_config/dunst" ]] && mkdir "$dir_config/dunst"
cp ~/.config/dunst/dunstrc "$dir_config/dunst/"

# fish
[[ ! -d "$dir_config/fish" ]] && mkdir "$dir_config/fish"
cp ~/.config/fish/config.fish "$dir_config/fish/"
cp ~/.config/fish/fish_variables "$dir_config/fish/"
cp -r ~/.config/fish/functions "$dir_config/fish/"

# gtk-3
[[ ! -d "$dir_config/gtk-3.0" ]] && mkdir "$dir_config/gtk-3.0"
cp ~/.config/gtk-3.0/settings.ini "$dir_config/gtk-3.0/"

# i3
[[ ! -d "$dir_config/i3" ]] && mkdir "$dir_config/i3"
cp ~/.config/i3/config "$dir_config/i3/"

# i3status
[[ ! -d "$dir_config/i3status" ]] && mkdir "$dir_config/i3status"
cp ~/.config/i3status/config "$dir_config/i3status/"
cp ~/.config/i3status/wrapper.py "$dir_config/i3status/"

# nvim
[[ ! -d "$dir_config/nvim" ]] && mkdir "$dir_config/nvim"
cp ~/.config/nvim/init.lua "$dir_config/nvim/"
cp -r ~/.config/nvim/lsp "$dir_config/nvim/"

# picom
[[ ! -d "$dir_config/picom" ]] && mkdir "$dir_config/picom"
cp ~/.config/picom/picom.conf "$dir_config/picom/"

# qlstatus
[[ ! -d "$dir_config/qlstatus" ]] && mkdir "$dir_config/qlstatus"
cp ~/.config/qlstatus/qlstatus.conf "$dir_config/qlstatus/"

# redshift
[[ ! -d "$dir_config/redshift" ]] && mkdir "$dir_config/redshift"
cp ~/.config/redshift/redshift.conf "$dir_config/redshift/"
cp -r ~/.config/redshift/hooks "$dir_config/redshift/."

# rofi
[[ ! -d "$dir_config/rofi" ]] && mkdir "$dir_config/rofi"
cp ~/.config/rofi/*.rasi "$dir_config/rofi/"

# spectrwm
[[ ! -d "$dir_config/spectrwm" ]] && mkdir "$dir_config/spectrwm"
cp ~/.config/spectrwm/spectrwm.conf "$dir_config/spectrwm/"

# stalonetray
[[ ! -d "$dir_config/stalonetray" ]] && mkdir "$dir_config/stalonetray"
cp ~/.config/stalonetray/stalonetrayrc "$dir_config/stalonetray/"

# terminator
[[ ! -d "$dir_config/terminator" ]] && mkdir "$dir_config/terminator"
cp ~/.config/terminator/config "$dir_config/terminator/"

# xmobar
[[ ! -d "$dir_config/xmobar" ]] && mkdir "$dir_config/xmobar"
cp ~/.config/xmobar/xmobarrc "$dir_config/xmobar/"

# xmonad
[[ ! -d "$dir_config/xmonad" ]] && mkdir "$dir_config/xmonad"
cp ~/.config/xmonad/xmonad.hs "$dir_config/xmonad/"
