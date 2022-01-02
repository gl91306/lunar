#!/bin/bash
#Script created by oxmc
#Made for Lunar-Client by gl91306

#install modprobe if not already installed

#Run modprobe fuse

cd
#Download client
wget https://github.com/gl91306/lunar/raw/master/lunarclient-2.8.0-armv7l.AppImage
if [ ! -d ~/lwjgl3arm32 ]; then
    mkdir ~/lwjgl3arm32
fi
if [ ! -d ~/lwjgl2arm32 ]; then
    mkdir ~/lwjgl2arm32
fi
if [ ! -f OpenJDK17U-jdk_arm_linux_hotspot_17.0.1_12.tar.gz ]; then
    wget https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.1%2B12/OpenJDK17U-jdk_arm_linux_hotspot_17.0.1_12.tar.gz
fi
if [ ! -f lwjgl3arm32.tar.gz ]; then
    wget https://github.com/mikehooper/Minecraft/raw/main/lwjgl3arm32.tar.gz
fi
if [ ! -f lwjgl2arm32.tar.gz ]; then
    wget https://github.com/mikehooper/Minecraft/raw/main/lwjgl2arm32.tar.gz
fi
if [ ! -d /opt/jdk ]; then
    sudo mkdir /opt/jdk
fi
sudo tar -zxf OpenJDK17U-jdk_arm_linux_hotspot_17.0.1_12.tar.gz -C /opt/jdk
tar -zxf lwjgl3arm32.tar.gz -C ~/lwjgl3arm32
tar -zxf lwjgl2arm32.tar.gz -C ~/lwjgl2arm32
cd lwjgl2arm32
wget https://github.com/gl91306/lunar/raw/master/libwebp-imageio32.so
wget https://github.com/gl91306/lunar/raw/master/libgstreamer-lite.so
wget https://github.com/gl91306/lunar/raw/master/libjfxmedia.so
cd
cd lwjgl3arm32
wget https://github.com/gl91306/lunar/raw/master/libwebp-imageio32.so
wget https://github.com/gl91306/lunar/raw/master/libgstreamer-lite.so
wget https://github.com/gl91306/lunar/raw/master/libjfxmedia.so
https://github.com/gl91306/lunar/raw/master/liblwjgl_tinyfd.so
cd
sudo apt-get install unzip
wget https://github.com/gl91306/lunar/raw/master/javafx-sdk-17.zip
mkdir lunarassets
unzip javafx-sdk-17.zip -d $HOME/lunarassets
cd lunarassets
cd javafx-sdk-17
cd lib
rm -rf libjfxwebkit.so
wget https://github.com/gl91306/lunar/raw/master/libjfxwebkit.so
cd
#Change perms of Launcher
sudo chmod +x $HOME/lunarclient-2.8.0-armv7l.AppImage

#Run launcher
cd
rm -rf jdk-16.0.1+9-jre.tar.gz
rm -rf javafx-sdk-17.zip
rm -rf lwjgl2arm32.tar.gz
rm -rf lwjgl3arm32.tar.gz
cd
cd lwjgl2arm32
rm -rf libopenal.so
cd
cp lwjgl3arm32/libopenal.so $HOME/lwjgl2arm32

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
Exec=$HOME/lunarclient-2.8.0-armv7l.AppImage
Icon=$HOME/lunarassets/lunarclient.png
Categories=Game;
Type=Application
Terminal=false" > "$HOME/.local/share/applications/Lunar-Client.desktop"

echo "[Desktop Entry]
Name=Lunar Client
Comment=Lunar Client for Rpi made by PiKATchu on Discord.
Exec=$HOME/lunarclient-2.8.0-armv7l.AppImage
Icon=$HOME/lunarassets/lunarclient.png
Categories=Game;
Type=Application
Terminal=false" > "$HOME/Desktop/Lunar Client"

$HOME/lunarclient-2.8.0-armv7l.AppImage
