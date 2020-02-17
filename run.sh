#!/bin/sh

cp ~/.bashrc .
cp ~/.fehbg .
cp ~/.tmux.conf .
cp ~/.vimrc .
cp ~/.xinitrc .
cp ~/.Xresources .

[[ ! -d ".config" ]] && mkdir .config

skip() {
    local excluded=('milcheck' 'qlbox.sh')
    for i in "${excluded[@]}"; do
        if [[ "$file" = "$i" ]]; then
            return 1
        fi
    done
    return 0
}

files=$(ls ~/bin)
[[ ! -d "bin" ]] && mkdir bin
for file in $files; do
    skip
    if [[ "$?" -eq 0 ]]; then
        cp ~/bin/$file bin/
    fi
done

[[ ! -d ".config/alacritty" ]] && mkdir .config/alacritty
cp ~/.config/alacritty/alacritty.yml .config/alacritty/

[[ ! -d ".config/conky" ]] && mkdir .config/conky
cp ~/.config/conky/conky.conf .config/conky/

[[ ! -d ".config/fish" ]] && mkdir .config/fish
[[ ! -d ".config/fish/functions" ]] && mkdir .config/fish/functions
cp ~/.config/fish/config.fish .config/fish/
cp ~/.config/fish/functions/* .config/fish/functions/

[[ ! -d ".config/i3" ]] && mkdir .config/i3
cp ~/.config/i3/config .config/i3/

[[ ! -d ".config/i3status" ]] && mkdir .config/i3status
cp ~/.config/i3status/config .config/i3status/

[[ ! -d ".config/picom" ]] && mkdir .config/picom
cp ~/.config/picom/picom.conf .config/picom/

[[ ! -d ".config/rofi" ]] && mkdir .config/rofi
cp ~/.config/rofi/*.rasi .config/rofi/

[[ ! -d ".config/terminator" ]] && mkdir .config/terminator
cp ~/.config/terminator/config .config/terminator/

[[ ! -d "xorg" ]] && mkdir xorg
cp /etc/X11/xorg.conf.d/*.conf xorg/
