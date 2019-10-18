#BeagleBone Login Using ssh usb to bBB
machinekit: qwer1234

```
pd -alsa -nogui -r 44100 -blocksize 64 -audiobuf 20 -audioadddev AudioBox adc_test.pd
best perfromnace
pd -alsa -nogui -r 44100 -blocksize 64 -audiobuf 35 -audioadddev AudioBox adc_test.pd
```
#HEAVY convert pd to C++
***https://github.com/enzienaudio/hvcc/blob/master/docs/01.introduction.md#what-is-heavy***

machinekit


to test

https://elinux.org/Beagleboard:BeagleBoneBlack_Debian#Kernel_Upgrade
http://bornageek.com/general/linux/hardware/2013/10/13/flashing-arch-linux-to-the-beaglebone-beaglebone-black-or-beaglebone-black-emmc.html
https://elinux.org/BeagleBoardUbuntu
https://purplepalmdash.github.io/2013/12/09/enable-audio-in-beaglebone-black/
https://www.howtoinstall.co/en/debian/stretch/osspd-pulseaudio
http://wiki.ros.org/melodic/Installation
https://forum.pdpatchrepo.info/topic/11290/mobmuplat-ready-effects-collection-i-e-30-vanilla-compliant-mmp-effects-w-gui

##Very IMportant 
1. https://cristos.vipserv.org/2015/09/linux-setup-for-real-time-audio-production/

dtb=am335x-boneblack-wireless.dtb

#Login


1.  ssh debian@192.168.6.2
2.  ssh  debian@192.168.6.2 -Y -v to launch X11 wiyj
3.  
2.  temppwd
3.  su
4.  root
5. or
6.  sudo su - root

To display PD 
5.  xauth add $(xauth -f ~root/.Xauthority list|tail -1) of 
6. xauth add $(xauth -f ~debian/.Xauthority list|tail -1)

5.  ON MACBOOK, To FOrward INternet to Beagle Via USB, On TERMINAL DO:

```
sudo sysctl net.inet.ip.forwarding=1
 echo "nat on en0 from en5:network to any -> (en0)" | sudo pfctl -f - -e
```

6. ==> ON BEAGLEBONE, To Enable INTERNET DO:

https://help.ubuntu.com/community/SoundTroubleshootingProcedure
```
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

/sbin/route add default gw 192.168.6.1

ip addr show
```

sudo shutdown -h now 

#setup reatime audio inlinux

```
nano /etc/security/limits.conf
```
#@beaglebone     -       rtprio          99
#@beaglebone     -       memlock         unlimited
#@beaglebone     -       nice            -10
```

# If you want to enable/disable realtime permissions, run
#     nano /etc/security/limits.d/audio.conf
#    dpkg-reconfigure -p high jackd

```
##http://jackaudio.org/faq/linux_rt_config.html
###Disable enable wifi

```
connmanctl technologies
ping www.google.com
sudo connmanctl
connmanctl> enable wifi
> scan wifi
> tether wifi disable
> services
```

## GEt linsence key for trusted
####How to download public key used to verify GnuPG signature for the repository
***https://blog.sleeplessbeastie.eu/2018/08/08/how-to-download-public-key-used-to-verify-gnupg-signature-for-the-repository/***


1. sudo apt-get install dirmngr --install-recommends
2. sudo rm /var/lib/apt/lists/lock
3. rm /var/cache/apt/archives/lock
4. sudo rm /var/lib/dpkg/lock

Boot/uEnv.txt
disable_uboot_overlay_wireless=1

###https://puredata.info/docs/faq/debian


nano /etc/apt/sources.list

##X11
*https://www.businessnewsdaily.com/11035-how-to-use-x11-forwarding.html*

1./etc/ssh/sshd_config.

```
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost yes
```
2. service sshd restart
3. sudo apt-get install x11-apps
4. sudo apt-get install xauth
5. open quatz terminal and connect via ssh  debian@162..... -X -v
6. xclock (window should pop on mac)
7. ssh  debian@192.168.6.2 -Y -v
8. ```pd -oss &```  to launch  pure data via X11
 
#Soundcard 
1. http://einsteiniumstudios.com/make-your-beaglebone-speak.html
2. https://andicelabs.com/2014/03/usb-audio-beaglebone/
3. https://purplepalmdash.github.io/2013/12/09/enable-audio-in-beaglebone-black/
3.

#Installinh Jack
Tutorial: JACK Audio Server: Basic Explanation, Install, and Setup
how to setup a realtime audio in linux
https://www.youtube.com/watch?v=fMz6fDGBnA4
https://www.youtube.com/watch?v=w2gPqH6kNJU
####http://www.freekb.net/Article?id=74
#avlinux seem nice
###http://www.bandshed.net/avlinux/

1. apt-get install qjackctl
2. whereis jackd
3.  
4.  jackd -d dummy //for server
5.  /usr/bin/qjackctl
6. sudo alsamixer --card=1
7. jackd -dalsa -dhw:0 -r44100 -p1024 -n3 -i1 -o2
8.

#to run alsa as jackdriver
 ```
 sudo yum install dbus-x11
 ```
 jackd -dalsa -dhw:0 -r44100 -p1024 -n3 -i1 -o2
cd /proc/asound/VSL

pd -alsa -nogui audiotest1.pd
## Use oss instaed
```
sudo modprobe snd-pcm-oss
pd -oss -blocksize 1024 
```

```
Hi. I wanted to tell you that I made it. It took me a long time to discover a solution that was in front of my eyes from the beginning.  In order for AVLinux to be able to select the firewire driver from jack, it is necessary to completely disable ALSA.

I want to tell you that Presonus not only IS COMPATIBLE with Linux, but it never worked better. ZERO LATENCE: I can set the buffer to 64 and it doesn't even immutate.

I'm too happy.

For those who want to make a Presonus FIREWIRE work, to the maximum of its quality and with the minimum latency, I transcribe the solution:

Create a text file in /etc/modprobe.d/ called 'snd_dice.conf' containing only the text 'blacklist snd_dice'.

Run 'depmod -ae' as root.

Recreate your initrd with 'update-initramfs -u'

With the 'snd_dice' ALSA modules disabled you can now use the older FFado drivers, to do this select the 'firewire' driver in Qjackctl as detailed earlier in this sectio

Source: https://bandshed.net/pdf/AVL2018UserManual.pdf

(on page 84)
```

jakkill -9 jackdbus



###https://puredata.info/docs/JackRoutingMultichannelAndBrowserAudio/

#TO DIsABLE alsa for usb
```nano /etc/modprobe.d/alsa-base.conf```

```options snd-usb-audio index = -1 ```insteat of -2


#use https://purplepalmdash.github.io/2013/12/09/enable-audio-in-beaglebone-black/ to inital usb audio first not nano /boot/uEnv/txt to diable audio

https://wiki.linuxaudio.org/wiki/raspberrypi

```
1

$ jackd -p256 -d alsa -d hw:2 -p2048 -D -n2 -r48000 -m -s -S

##on pc avl32
jackd -p256 -d alsa -d hw:1 -p2048 -D -n2 -r48000 -m -s -S

##on another terminal
 pd -jack'
 
 
  
/etc/pulse/default.pa contains

### Automatically connect sink and source if JACK server is present
.ifexists module-jackdbus-detect.so
.nofail
load-module module-jackdbus-detect channels=2
.fail
.endif
```

to kill qjack

```
ps -e | grep jack
kill pid
```
```
Uninstall dbus-x11
To remove just dbus-x11 package itself from Ubuntu 14.04 (Trusty Tahr) execute on terminal:

sudo apt-get remove dbus-x11
Uninstall dbus-x11 and it's dependent packages
To remove the dbus-x11 package and any other dependant package which are no longer needed from Ubuntu Trusty.

sudo apt-get remove --auto-remove dbus-x11
Purging dbus-x11
If you also want to delete configuration and/or data files of dbus-x11 from Ubuntu Trusty then this will work:

sudo apt-get purge dbus-x11
To delete configuration and/or data files of dbus-x11 and it's dependencies from Ubuntu Trusty then execute:

sudo apt-get purge --auto-remove dbus-x11
```
#Increase perfromnace and detch culprit
##https://cristos.vipserv.org/2015/09/linux-setup-for-real-time-audio-production/


```
debian@beaglebone:/etc/udev/rules.d$ sudo nano 40-hpet-permission.rules
[sudo] password for debian:
debian@beaglebone:/etc/udev/rules.d$ ls
40-hpet-permission.rules  80-gpio-noroot.rules      85-gpio-noroot.rules
50-hidraw.rules           81-pwm-noroot.rules       beagle-tester.rules
50-spi.rules              82-gpio-config-pin.rules  tisdk.rules
60-omap-tty.rules         83-eqep-noroot.rules      uio.rules
70-persistent-net.rules   84-gpio-noroot.rules
debian@beaglebone:/etc/udev/rules.d$ cd /etc/sysctl.d/
debian@beaglebone:/etc/sysctl.d$ ls
99-sysctl.conf  README.sysctl
debian@beaglebone:/etc/sysctl.d$ sudo nano 10-swap-inotify.conf
debian@beaglebone:/etc/sysctl.d$ cd /proc/interrupts
-bash: cd: /proc/interrupts: Not a directory
debian@beaglebone:/etc/sysctl.d$ nano /proc/interrupts
debian@beaglebone:/etc/sysctl.d$ nano /proc/interrupts lspci -vvv
debian@beaglebone:/etc/sysctl.d$ lsusb
Bus 001 Device 002: ID 194f:0103 PreSonus Audio Electronics, Inc. AudioBox 1818 VSL
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
debian@beaglebone:/etc/sysctl.d$ ip link set <YOUR_WLAN_DEVICE> down
-bash: YOUR_WLAN_DEVICE: No such file or directory
debian@beaglebone:/etc/sysctl.d$ nano /proc/interrupts lspci -vvv
Use "fg" to return to nano.

[1]+  Stopped                 nano /proc/interrupts lspci -vvv
debian@beaglebone:/etc/sysctl.d$ ip link set wl18xx  down
Cannot find device "wl18xx"
debian@beaglebone:/etc/sysctl.d$ ip link set wl18xx  down
```


#jackD on beaglebone
each on one terminal fomr X11

jackd -p1024 -d alsa -d hw:1 -p2048 -D -n2 -r22050 -m -s -S
jackd -d alsa -d hw:1 -p2048 -D -n7 -r44100 -m -s -S
pd -jack

##Cron on linus
#https://www.cyberciti.biz/faq/linux-execute-cron-job-after-system-reboot/

crontab -e

```
* * * * *  /home/isotester/startup.sh
#every 5 second
* * * * * REMAIN=60 INC=5 ; while ; do /bin/cmd -arg1 ; sleep $INC; REMAIN=$(($REMAIN - $INC)); done
```

##in root cd ~/ to run @reboot in crontab -e
touch startup.sh

chmod +x startup.sh
```
#! /bin/sh
# Print the IP address
echo "\ngood:)\m" > log.txt
```


create log.txt and change persmission if needed

sudo /etc/init.d/cron start


##https://wiki.archlinux.org/index.php/JACK_Audio_Connection_Kit#GUI
```
start_jack.sh
#!/bin/bash

jack_control start
jack_control ds alsa
jack_control dps device hw:HD2
jack_control dps rate 48000
jack_control dps nperiods 2
jack_control dps period 64
sleep 10
a2jmidid -e &
sleep 10
qjackctl &

```

nano /boot/uEnv.txt to diable cape on beaglebone

aplay /usr/share/sound/alsa/front
arecord -f S16_LE -r 44100 -c 4 -D multi | aplay -f S16_LE -r 44100 -c 4 -D multi

# USB audio
snd-usb-audio nrpacks=1
options snd-usb-audio index=0

##Sample rate and 16 bit vs 24  bit
http://www.voxforge.org/home/docs/faq/faq/linux-how-to-determine-your-audio-cards-or-usb-mics-maximum-sampling-rate
https://askubuntu.com/questions/421607/how-to-convert-an-audio-streams-format
https://ubuntuforums.org/showthread.php?t=2188686

#GEt bit depth of usb sound cards
cd /proc/asound/
 sudo gedit /etc/pulse/daemon.conf MAYBE USE To check for alsa ones
 /lib/modprobe.d$ nano aliases.conf 
 
 Presonus is S32_LE
 
 ```
 # IMPORTANT: DO NOT COPY CONTENTS OF THIS FILE TO TEXT EDITOR IF VIEWING FROM WEB BROWSER, JUST SAVE THE FILE TO YOUR COMPUTER!!!
# OR VIEW THIS FILE IN UNICODE (UTF-8) MODE IF YOU REALLY WANT TO COPY AND PASTE
# OTHERWISE YOU WILL GET FORMATTING ERRORS AND THE FILE WILL NOT WORK
#
# The first configuration line will put the FastTrack Pro at device number 5 with 24bit mode, max.
# 48kHz sampling mode, 2 inputs and 4 outputs. This is the default.
#
#
# The second configuration line will run the FastTrack pro also in 24 bit mode but with sampling rate above 48KHz
# Only Playback mode works above this rates.
# Probably good only for mastering at high resolution.
#
#
# The third line enables the digital in/outs on the Fast Trac Pro.
# I have not tested or played much with this one, feel free to try it yourself.
#
#
# Only uncomment one line (remove # at start of line) depending how you are going to use your FastTrack Pro
# and remember to reboot your system for changes to take effect. Although the default setting should be good for recording and playback at the same time.
#
# Instead of rebooting you can also try unloading and reloading the snd-usb-audio module by doing the following in a terminal:
#
#	MAKE SURE TO POWER OFF THE FAST TRACK PRO AND OTHER USB AUDIO DEVICES BEFORE RUNNING THE FOLLOWING COMMANDS
#	OR YOU WILL GET AN ERROR MESSAGE SAYING THAT THE SPECIFIC MODULE IS IN USE
#
#	sudo modprobe -r snd-usb-audio
#	sudo modprobe snd-usb-audio
#
# If that doesn't work then just reboot to play it safe
#
# According to the patch, the possible values for the device_setup parameter are the sum of the following numbers:
#
#    * 0×01 : use the device_setup parameter, always needed
#    * 0×02 : enable digital output (channels 3,4)
#    * 0×04 : use 48kHz-96kHz sampling rate, 8-48 kHz if not used
#    * 0×08 : 24bit sampling rate
#    * 0×10 : enable digital input (channels 3,4)
#
#===========================================================================================================================================
#
# CONFIGURATION LINES:
https://alsa-project.org/wiki/Matrix:Module-usb-audio

options	snd_usb_audio	vid=0x763 pid=0x2012 device_setup=0x9 index=5 enable=1

#options	snd_usb_audio	vid=0x763 pid=0x2012 device_setup=0x5 index=5 enable=1

#options	snd_usb_audio	vid=0x763 pid=0x2012 device_setup=0x13 index=5 enable=1

 ```
 
  nano /etc/group
  chekc if root od debian is in audio group
  

 #Audio production
1. Install the low lancykernel
2. sudo apt install linux-lowlantency
3. configure reatltime access
4. sudo adduser debiean audio
5. sudo nano /etc/security/limit.d/audio.conf
6. add KXSTudiorepri
7. install pulseaudio-module-jack
8. sudo apt install pulseaudio-module-jack



##TEST SOUN
sudo  nano /etc/asound.conf

```

pcm.!default {
#format S32_LE
#rate 441000
type hw
card 1
#device 0
}
ctl.!default {
type hw
card  1
#device 0
}

```
aplay -D plughw:1,0 /usr/share/sounds/alsa/Front_Center.wav
pactl list short sinks
alsamixer -c

```
deb http://deb.debian.org/debian stretch main contrib non-free
deb-src http://deb.debian.org/debian stretch main contrib non-free

deb http://deb.debian.org/debian stretch-updates main contrib non-free
# deb-src http://deb.debian.org/debian stretch-updates main contrib non-free


deb http://deb.debian.org/debian-security stretch/updates main contrib non-free
# deb-src http://deb.debian.org/debian-security stretch/updates main contrib non-free

deb http://deb.debian.org/debian stretch-backports main contrib non-free
deb-src http://deb.debian.org/debian stretch-backports main contrib non-free

#Kernel source (repos.rcn-ee.com) : https://github.com/RobertCNelson/linux-stable-rcn-ee
#
#git clone https://github.com/RobertCNelson/linux-stable-rcn-ee
#cd ./linux-stable-rcn-ee
#git checkout `uname -r` -b tmp
#
deb [arch=armhf] http://repos.rcn-ee.com/debian/ stretch main
# deb-src [arch=armhf] http://repos.rcn-ee.com/debian/ stretch main

```

to exploer /usr/share/alsa/cards$

#Debian – getting a lowlatency kernel.
```

For audio work a lowlatency kernel or an rt-patched kernel should be used. Lowlatency is enough in most cases. Personally I’ve found that only an rt-patched kernel was capable of avoiding x-runs.

In Debian you can get an rt-patched kernel directly from the main repository. To install a lowlatency kernel, though, you need to compile one yourself, but that is quite easy. In the steps below change the version number to match the version number you want to use.

apt-get install build-essential fakeroot
apt-get build-dep linux
apt-get install libncurses5-dev libncursesw5-dev
apt-get install linux-source-4.2
tar -xaf /usr/src/linux-source-4.2.tar.xz
cd linux-source-4.2
cp /boot/config-4.2.0-1-amd64 .config
make menuconfig

In the gui:
enable preempt
enable timers 1000Hz

make -j4 deb-pkg LOCALVERSION=-lowlatency KDEB_PKGVERSION=$(make kernelversion)-1
cd ..
dpkg -i linux-headers-4.2.5-lowlatency_4.2.5-1_amd64.deb 
dpkg -i linux-image-4.2.5-lowlatency_4.2.5-1_amd64.deb
```

aplay -D plughw:1,0 ./file_example_WAV_5MG.wav

```
Switch from USB-DMA back to PIO in the config-armv7 file:

-CONFIG_USB_TI_CPPI41_DMA=y
+# CONFIG_USB_TI_CPPI41_DMA is not set
+CONFIG_MUSB_PIO_ONLY=y
```

```
First please upgrade to "3.14.26-ti-r43"


sudo apt-get update
sudo apt-get install linux-image-3.14.26-ti-r43
sudo reboot


There's been a few "musb" patches..


Although we may just have to disable "usb dma"


https://github.com/beagleboard/linux/blob/1d0defeba9685e616b05f7340111ab84c47ad762/arch/arm/configs/bb.org_defconfig#L3727


From:


CONFIG_USB_TI_CPPI41_DMA=y
# CONFIG_MUSB_PIO_ONLY is not set


to:
# CONFIG_USB_TI_CPPI41_DMA is not set
CONFIG_MUSB_PIO_ONLY=y


Right now, i'm keeping DMA enabled, so we can continue to test this
kernel as TI is still developing it, but we may have to end up in pio
mode to support every usb device..
```
#https://archlinuxarm.org/platforms/armv7/ti/beaglebone-black
#verion
Linux beaglebone 4.9.82-ti-r102 #1 SMP PREEMPT Thu Feb 22 01:16:12 UTC 2018 armv7l GNU/Linux

Linux beaglebone 4.14.108-ti-r113 #1 SMP PREEMPT Wed Jul 31 00:01:10 UTC 2019 armv7l GNU/Linux

 ssh-keygen -R 192.168.6.2

##VERY IMpotsnat 
#http://www.bootembedded.com/embedded-linux/building-embedded-linux-scratch-beaglebone-black/


#Backup image
https://www.ofitselfso.com/BeagleNotes/CloningABootableBeagleboneBlackSDCard.php
#to run
pd -nogui BBmixer.pd





