# Lunar Client for Arm

This is a build of the Moonsworth Lunar Client for ARM processors. Because Lunar Client's API does not support ARM, I added some code that fetches your own java instead of Lunars custom one.

There is also a script for automatically changing the lwjgl args for ARM.

There's also support for Microsoft Accounts!

# TY TO KOLPIX 4 HELPING ME BUILD for ARM64 FOR LATEST VERSION


# Dependecies

Download the install script and run it.

ARM32
```
wget https://raw.githubusercontent.com/gl91306/lunar/master/install.sh
chmod +x install.sh
./install.sh
```

ARM64
```
wget https://raw.githubusercontent.com/gl91306/lunar/master/install64.sh
chmod +x install64.sh
./install64.sh
```

Thats it!

Here's a Youtube video for the installation: https://youtu.be/-2LZG9YSKZg

:D

Find it on Pi-ware!

## fast launching (a bit of a hacky solution btw)
Becauser of updates as to how lunar client launches, it takes forever to launch

You can, however use the launch command to get it to launch faster

To get this to work you need to first launch the version you want to get the launch command for

Then you need to type
```
ps aux | grep lunar
```
in the terminal

Look for the command that starts with /home/whatever/.lunarclient/234234234/somethingoffine/java something and ends with --height something --width somethin

Copy that and save it somewhere

Now go to your desktop and create a new file and name it Lunar client (ur version name here, so you can tell the diffrence from the main one)

In that file add
```
[Desktop Entry]
Name=Lunar Client (version name here)
Comment=Lunar Client for Rpi made by PiKATchu on Discord.
Exec=(command goes here)
Icon=/home/pi/lunarassets/lunarclient.png
Categories=Game;
Type=Application
Terminal=false
Name[en_US]=lunar (version)
Path=/home/pi/.lunarclient/offline/(version, be sure to look in the folder to find the exact version folder name)
Comment[en_US]=(version) lmao
GenericName=sdfasdf idek
```
and save it as Lunar Client (version name here)

Then go to terminal and 
```
cd Desktop
chmod +x 'Lunar Client (version name here)'
./'Lunar Client (version name here)'
```
then go to your desktop and double click, and it should launch a lot faster :DDDDDDDDDDDDDDDDDDDDDDDDD
