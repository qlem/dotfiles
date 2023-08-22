#!/bin/bash

# This script is called by udev rule /etc/udev/rules.d/99-hhkb.rules
# when the HHKB keyboard is plugged in (USB).
# udevadm info --attribute-walk --name=/dev/input/event19

(
if ! xinput --version &> /dev/null; then
  >&2 printf "%s\n" "xinput, command not found"
  exit 1
fi

if ! xkbcomp -version &> /dev/null; then
  >&2 printf "%s\n" "xkbcomp, command not found"
  exit 1
fi

id=$(xinput list --id-only "PFU Limited HHKB-Classic")
while [ -z "$id" ]; do
  sleep 1
  id=$(xinput list --id-only "PFU Limited HHKB-Classic")
done
xkbcomp -i "$id" "/home/qlem/.local/share/xkb/hhkb-custom-layout.xkb" "$DISPLAY"
) &
