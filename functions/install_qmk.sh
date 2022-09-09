#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo
sudo pacman --needed --noconfirm -S git python-pip libffi avrdude dfu-util dfu-programmer arm-none-eabi-gcc udev
sudo pacman --needed --noconfirm -U https://archive.archlinux.org/packages/a/arm-none-eabi-newlib/arm-none-eabi-newlib-4.1.0-2-any.pkg.tar.zst
python3 -m pip install --user qmk
qmk setup -H ~/repos/qmk_firmware --yes
sudo cp ~/repos/qmk_firmware/util/udev/50-qmk.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
yes | sudo pacman -Scc

sudo steamos-readonly enable