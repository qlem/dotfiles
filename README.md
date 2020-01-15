# Archlinux Installation Tips

## Dual boot partitioning - Windows UEFI 
```
mkdir /mnt/boot & mkdir /mnt/boot/efi
mount esp_partition /mnt/boot/efi
```

## GRUB + microcode
```
pacman -S grub efibootmgr intel-ucode
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
```

## Add Windows to GRUB
```
pacman -S os_prober
grub-mkconfig -o /boot/grub/grub.cfg
```

## Create a new user
```
useradd -m -g users -G wheel -s /bin/bash username
passwd username
pacman -S sudo
```
Edit `/etc/sudoers`
```
username ALL=(ALL) ALL
```

## XORG
```
pacman -S xorg-server
```
Then create `/etc/X11/xorg.conf.d/00-keyboard.conf`
```
Section "InputClass"
    Identifier "system-keyboard"
    MatchIsKeyboard "on"
    Option "XkbLayout" "fr"
    Option "XkbModel" "pc"
EndSection
```

## User's directories
```
pacman -S xdg-user-dirs
xdg-user-dirs-update
```

## Dev tools
```
pacman -S terminator emacs gcc make cmake valgrind git openssh python unzip
```

## Enable FSTRIM for SSD
```
sudo systemctl enable fstrim.timer
```

## Theme
- theme [Adapta](https://github.com/adapta-project/adapta-gtk-theme)  
- icon theme [Flat Remix](https://github.com/daniruiz/flat-remix)
```
pacman -S plank
```
