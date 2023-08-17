#!/bin/bash
#Script created by oxmc and gl91306
#Made for Lunar Client for arm, a port by gl91306

#install modprobe if not already installed
if [[ -f "/usr/bin/apt" ]]
then
    sudo apt-get install kmod
fi
if [[ -f "/usr/bin/pacman" ]]
then
    sudo pacman -S kmod
fi


#Run modprobe fuse
sudo modprobe fuse

cd
#Download client in parts
echo "downloading split files"
wget https://github.com/gl91306/lunar/raw/master/lunarclient-3.0.3-armv7l.AppImage.1
wget https://github.com/gl91306/lunar/raw/master/lunarclient-3.0.3-armv7l.AppImage.1
#Combine
echo "combining split files"
cat lunarclient-3.0.3-armv7l.AppImage.* > lunarclient-3.0.3-armv7l.AppImage
rm -rf lunarclient-3.0.3-armv7l.AppImage.*

mkdir lunarassets
cd lunarassets
cd
#Change perms of Launcher
sudo chmod +x $HOME/lunarclient-3.0.3-armv7l.AppImage
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
Exec=$HOME/lunarclient-3.0.3-armv7l.AppImage --no-sandbox
Icon=$HOME/lunarassets/lunarclient.png
Categories=Game;
Type=Application
Terminal=false" > "$HOME/.local/share/applications/Lunar-Client.desktop"

echo "[Desktop Entry]
Name=Lunar Client
Comment=Lunar Client for Rpi made by PiKATchu on Discord.
Exec=$HOME/lunarclient-3.0.3-armv7l.AppImage --no-sandbox
Icon=$HOME/lunarassets/lunarclient.png
Categories=Game;
Type=Application
Terminal=false" > "$HOME/Desktop/Lunar Client"

echo "Installation complete, running..."
$HOME/lunarclient-3.0.3-armv7l.AppImage
