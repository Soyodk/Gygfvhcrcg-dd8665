#!/bin/bash

# Iniciar o servidor VNC
x11vnc -forever -usepw -create &

# Iniciar NoVNC
/opt/novnc/utils/novnc_proxy --vnc localhost:5900 --listen 8080 &

# Iniciar o emulador Android
emulator -avd Pixel_Play -gpu swiftshader_indirect -no-snapshot-load -no-boot-anim -qemu -m 2048
