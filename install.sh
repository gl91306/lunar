#!/bin/bash
#Script created by oxmc
#Made for Lunar-Client by gl91306

#install modprobe if not already installed
sudo apt-get install kmod

#Run modprobe fuse
sudo modprobe fuse

cd
#Download client
wget https://github.com/gl91306/lunar/raw/master/lunarclient-2.10.1-armv7l.AppImage
sudo apt-get install unzip
mkdir lunarassets
cd lunarassets
cd
#Change perms of Launcher
sudo chmod +x $HOME/lunarclient-2.8.0-armv7l.AppImage
#Add icon
cd
cd lunarassets
wget https://github.com/gl91306/lunar/raw/master/lunarclient.png
cd

#Then make menu button & desktop icon
echo "Creating a desktop entry for Lunar-Client..."
echo "[Desktop Entry]
Name=Lunar Client
Comment=Lunar Client for Rpi made by PiKATchu on Discord.
Exec=$HOME/lunarclient-2.10.1-armv7l.AppImage --no-sandbox
Icon=$HOME/lunarassets/lunarclient.png
Categories=Game;
Type=Application
Terminal=false" > "$HOME/.local/share/applications/Lunar-Client.desktop"

echo "[Desktop Entry]
Name=Lunar Client
Comment=Lunar Client for Rpi made by PiKATchu on Discord.
Exec=$HOME/lunarclient-2.10.1-armv7l.AppImage --no-sandbox
Icon=$HOME/lunarassets/lunarclient.png
Categories=Game;
Type=Application
Terminal=false" > "$HOME/Desktop/Lunar Client"

$HOME/lunarclient-2.10.1-armv7l.AppImage
