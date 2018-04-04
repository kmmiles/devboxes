#!/bin/bash

echo "configuring hdmi..."
export DISPLAY=:0
dbus-launch gsettings set org.gnome.desktop.interface scaling-factor 2
dbus-launch gsettings set org.cinnamon active-display-scale 2
dbus-launch gsettings set org.cinnamon.desktop.interface scaling-factor "uint32 2"
