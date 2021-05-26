#!/bin/bash
#Script created by oxmc
#Made for Lunar-Client by gl91306

#install modprobe if not already installed
if ! command -v modprobe >/dev/null;then
  
  if [ -f /usr/bin/apt ];then
    sudo apt update
    sudo apt install -y modprobe || echo "Failed to install modprobe."
  else
    error "Failed to find any package manager to install modprobe."
  fi
fi

#Run modprobe fuse
sudo modprobe fuse

#Download client
wget https://github.com/gl91306/lunar/blob/master/lunarclient-2.7.0-armv7l.AppImage?raw=true

#Change perms of Launcher
sudo chmod +x $HOME/lunarclient-2.7.0-armv7l.AppImage

#Run launcher
$HOME/lunarclient-2.7.0-armv7l.AppImage

#Handle error about jvm
#Copy jdk version into ~/.lunarclient/jre/zulu8.52.0.23-ca-fx-jre8.0.282-linux_x64
rm -rf $HOME/.lunarclient/jre/zulu8.52.0.23-ca-fx-jre8.0.282-linux_x64
sudo cp /opt/jdk/jdk1.8.0_251/jre ~/.lunarclient/jre/zulu8.52.0.23-ca-fx-jre8.0.282-linux_x64

#Then make menu button
echo "Creating a desktop entry for Lunar-Client..."
echo "[Desktop Entry]
Name=\"Lunar-Client for Rpi\"
Comment=\"Lunar-Client for Rpi made by PiKATchu on Discord.\"
Exec=$HOME/lunarclient-2.7.0-armv7l.AppImage
Icon=$HOME/.lunarclient/icon.png
Categories=Utility;
Type=Application
Terminal=false" > "$HOME/.local/share/applications/Lunar-Client.desktop"
