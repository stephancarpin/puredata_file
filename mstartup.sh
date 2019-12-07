#! /bin/sh
# Print the IP address
echo "\ngood:)\m" > ./puredata_file/loggg.txt
#echo "nameserver 8.8.8.8" >> /etc/resolv.conf
#/sbin/route add default gw 192.168.6.1

#usinf=g alsa
#pd -alsa -rt -nogui  -r 44100 -blocksize 64 -audiobuf 35 -audioadddev AudioBox ./puredata_file/adcTest.pd
#pd -alsa -rt -nogui -r 44100 -blocksize 64 -audiobuf 35 -audioadddev AudioBox ./puredata_file/BBmixerLooperUndo.pd
#using 0ss
#sleep 10
#sudo systemctl disable avahi-daemon.socket
#sudo service avahi-daemon stop
sudo modprobe snd-pcm-oss
#0sleep 10
#pd -oss -nrt -nogui  -r 44100 -blocksize 32 -audiobuf 10 ./puredata_file/BBmixerLooperUndo.pd
#pd -oss -nrt -nogui  -r 44100 -blocksize 8 -audiobuf 10 ./puredata_file/BBmixerLooperUndo.pd
#pd -oss -nrt -nogui  -alsamidi -mididev 1  -r 44100 -blocksize 32 -audiobuf 10 ./puredata_file/LooperUndoExtened.pd
