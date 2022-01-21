#!/bin/bash
#Script created by oxmc
#Made for Lunar-Client by gl91306

cd
#Download client
wget https://github.com/gl91306/lunar/raw/master/lunarclient-2.8.0-arm64.AppImage
if [ ! -d ~/lwjgl3arm64 ]; then
    mkdir ~/lwjgl3arm64
fi
if [ ! -d ~/lwjgl2arm64 ]; then
    mkdir ~/lwjgl2arm64
fi
if [ ! -f lwjgl3arm64.tar.gz ]; then
    wget https://github.com/mikehooper/Minecraft/raw/main/lwjgl3arm64.tar.gz
fi
if [ ! -f lwjgl2arm64.tar ]; then
    wget https://raw.githubusercontent.com/gl91306/lunar/03b8f8735ba30d2a849a4d7321254b085f00cb88/lwjgl2arm64.tar
fi
if [ ! -f OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.1_12.tar.gz ]; then
    wget https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.1%2B12/OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.1_12.tar.gz
fi
if [ ! -d /opt/jdk ]; then
    sudo mkdir /opt/jdk
fi
sudo tar -zxf OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.1_12.tar.gz -C /opt/jdk
tar -zxf lwjgl3arm64.tar.gz -C ~/lwjgl3arm64
tar -zxf lwjgl2arm64.tar -C ~/lwjgl2arm64
cd
cd lwjgl3arm64
wget https://github.com/gl91306/lunar/raw/master/libwebp-imageio64.so
cd
cd lwjgl2arm64
wget https://github.com/gl91306/lunar/raw/master/libwebp-imageio64.so
cd
mkdir lunarassets
sudo apt-get install unzip
wget https://github.com/gl91306/lunar/raw/master/javafx-sdk-17-64.zip
unzip javafx-sdk-17-64.zip -d $HOME/lunarassets
cd
#Change perms of Launcher
sudo chmod +x $HOME/lunarclient-2.8.0-arm64.AppImage

#Run launcher
cd
rm -rf jdk-16.0.1+9-jre64.gz
rm -rf javafx-sdk-17-64.zip
rm -rf lwjgl3arm64.tar.gz
rm -rf lwjgl2arm64.tar.gz
cd

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
Exec=$HOME/lunarclient-2.8.0-arm64.AppImage
Icon=$HOME/lunarassets/lunarclient.png
Categories=Game;
Type=Application
Terminal=false" > "$HOME/.local/share/applications/Lunar-Client.desktop"

echo "[Desktop Entry]
Name=Lunar Client
Comment=Lunar Client for Rpi made by PiKATchu on Discord.
Exec=$HOME/lunarclient-2.8.0-arm64.AppImage
Icon=$HOME/lunarassets/lunarclient.png
Categories=Game;
Type=Application
Terminal=false" > "$HOME/Desktop/Lunar Client"
