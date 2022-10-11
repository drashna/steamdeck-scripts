#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo
sudo pacman --needed --noconfirm -S base-devel clang diffutils gcc git unzip wget zip python-pip avr-binutils arm-none-eabi-binutils arm-none-eabi-gcc
sudo pacman --needed --noconfirm -S avrdude dfu-programmer dfu-util riscv64-elf-binutils riscv64-elf-gcc riscv64-elf-newlib
sudo pacman --needed --noconfirm -U https://archive.archlinux.org/packages/a/avr-gcc/avr-gcc-8.3.0-1-x86_64.pkg.tar.xz
sudo pacman --needed --noconfirm -S avr-libc # Must be installed after the above, or it will bring in the latest avr-gcc instead
sudo pacman --needed --noconfirm -S hidapi  # This will fail if the community repo isn't enabled
sudo pacman --needed --noconfirm -S git python-pip libffi avrdude dfu-util dfu-programmer arm-none-eabi-gcc udev
sudo pacman --needed --noconfirm -U https://archive.archlinux.org/packages/a/arm-none-eabi-newlib/arm-none-eabi-newlib-4.1.0-2-any.pkg.tar.zst
python3 -m pip install --user qmk
qmk setup -H ~/repos/qmk_firmware --yes
python3 -m pip install --user -r ~/repos/qmk_firmware/requirements-dev.txt
sudo cp ~/repos/qmk_firmware/util/udev/50-qmk.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
yes | sudo pacman -Scc

sudo steamos-readonly enable