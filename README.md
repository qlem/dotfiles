# Archlinux install

## Partitioning

## Enable microcode updates

Install `intel-ucode`

## Boot loader

To install `systemd-boot` with XBOOTLDR partition
```
bootctl --esp-path=/efi --boot-path=/boot install
```

Create `/efi/loader/loader.conf`
```
default       arch-default.conf
timeout       4
console-mode  max
editor        no
```

Create default loader `/boot/loader/entries/arch-default.conf`
```
title    Arch Linux
linux    /vmlinuz-linux
initrd   /intel-ucode.img
initrd   /initramfs-linux.img
options  root=... resume=... rw quiet splash
```

Create fallback loader `/boot/loader/entries/arch-fallback.conf`
```
title    Arch Linux (fallback initramfs)
linux    /vmlinuz-linux
initrd   /intel-ucode.img
initrd   /initramfs-linux-fallback.img
options  root=... rw quiet splash
```

## Add user

```
useradd -m -G wheel -s /bin/bash username
passwd username
```

## Sudo

Install `sudo` package then uncomment this line in `/etc/sudoers`
```
# %wheel ALL=(ALL:ALL) ALL
```

## Network configuration

Create the hostname file `/etc/hostname`
```
my_hostname
```

Edit `/etc/hosts` file
```
127.0.0.1   localhost
::1         localhost
127.0.1.1   my_hostname.localdomain my_hostname
```

Start and enable `systemd-networkd.service` and `systemd-resolved.service`
```
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
```

Create `/etc/systemd/network/25-wireless.network`
```
[Match]
Name=wlan0

[Network]
DHCP=yes
IgnoreCarrierLoss=3s
```

Install `iwd` package then start and enable `iwd.service`.
Authenticate to desired wireless network with `iwctl`.

## Xorg configuration

Install the following packages:
- `xorg-server`
- `xorg-xbacklight`
- `xorg-xev`
- `xorg-xinit`
- `xorg-xrandr`

For intel graphics:
- `mesa`
- `xf86-video-intel`

Create `/etc/X11/xorg.conf.d/00-keyboard.conf`
```
Section "InputClass"
	Identifier "system-keyboard"
	MatchIsKeyboard "on"
	Option "XkbLayout" "fr"
	Option "XkbModel" "pc"
EndSection
```

Create `/etc/X11/xorg.conf.d/10-monitor.conf`
```
Section "Monitor"
    Identifier "eDP-1"
    Option "Primary" "true"
    Option "DPMS" "true"
EndSection

Section "ServerFlags"
    Option "StandbyTime" "3"
    Option "SuspendTime" "5"
    Option "OffTime" "10"
EndSection

Section "ServerLayout"
    Identifier "ServerLayout0"
EndSection
```

Create `/etc/X11/xorg.conf.d/30-touchpad.conf`
```
Section "InputClass"
    Identifier "system-touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "ClickMethod" "clickfinger"
    Option "NaturalScrolling" "true"
    Option "ScrollMethod" "twofinger"
EndSection
```

## User's directories

Install `xdg-user-dirs` package
```
LC_ALL=C xdg-user-dirs-update --force
```

## Sound system

Install the following packages:
- `pipewire`
- `pipewire-alsa`
- `pipewire-audio`
- `pipewire-jack`
- `pipewire-pulse`

Start and enable `pipewire-pulse.service`

## Xmonad

Install [GHCup](https://www.haskell.org/ghcup/install/) to get `stack`

Clone `xmonad` and `xmonad-contrib` repositories in  `~/.config/xmonad`
```
git clone --branch <tagged release> https://github.com/xmonad/xmonad
git clone --branch <tagged release> https://github.com/xmonad/xmonad-contrib
```

Install xmonad
```
stack init
stack install
```

## Xmobar

Clone `xmobar` repository
```
git clone --branch <tagged release> https://codeberg.org/xmobar/xmobar.git
```

Edit compilation flags in `stack.yaml`. See xmobar [documentation](https://codeberg.org/xmobar/xmobar).
```
stack install
```

## TRIM

Make sure SSD supports TRIM through:
```
lsblk --discard
```
Non-zero values from DISC-GRAN and DISC-MAX columns indicate TRIM support.

Enable `fstrim.timer` to activate periodic TRIM.

## Theme

- theme [Adapta](https://github.com/adapta-project/adapta-gtk-theme)  
- icons [Flat Remix](https://github.com/daniruiz/flat-remix)
