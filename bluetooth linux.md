https://www.youtube.com/watch?v=CB1E4Ir3AV4
<<<<<<< HEAD


#working status
pd -alsamidi -mididev 1
sudo aconnect -l
sudo aconnect 129:0 130:0


#To connect serial Arduino Midi

***http://www.varal.org/ttymidi/ ***

Check connection serial

```
ls /dev/
```
Should find ttyACM0

```
sudo ttymidi -s /dev/ttyACM0 -v
aconnect 'ttymidi':0 'Pure Data':0

```
##serial midi
#on Arduino use 
```

#include <MIDI.h>
//
//#if defined(USBCON)
//#include <midi_UsbTransport.h>
//
//static const unsigned sUsbTransportBufferSize = 16;
//typedef midi::UsbTransport<sUsbTransportBufferSize> UsbTransport;
//
//UsbTransport sUsbTransport;
//
//MIDI_CREATE_INSTANCE(UsbTransport, sUsbTransport, MIDI);
//
//#else // No USB available, fallback to Serial
//MIDI_CREATE_DEFAULT_INSTANCE();
//#endif


int sensorReading = 0; 
int velocity = 100;//velocity of MIDI notes, must be between 0 and 127
 //higher velocity usually makes MIDI instruments louder
 const int knockSensor = A0;
 int noteON = 144;//144 = 10010000 in binary, note on command
 int noteOFF = 128;//128 = 10000000 in binary, note off command

 const int threshold = 3;

 

void setup() {
  //  Set MIDI baud rate:
  Serial.begin(31250);
}

void loop() {


  sensorReading = analogRead(knockSensor);
  



 if (sensorReading >= threshold) {
    
   MIDImessage(noteON, 36, sensorReading);//turn note on
    delay(10);//hold note for 300ms
    MIDImessage(noteOFF, 36, 0);//turn note off
    delay(10);//wait 200ms until triggering next note
  }
  delay(5);  // delay to avoid overloading the serial port buffer
}

//send MIDI message
void MIDImessage(int command, int MIDInote, int MIDIvelocity) {
  Serial.write(command);//send note on or note off command 
  Serial.write(MIDInote);//send pitch data
  Serial.write(MIDIvelocity);//send velocity data
}

```

#Some Bluetooth cmd

```
=======
>>>>>>> 9bd26d3388d155ecd64d73d50f6c30fb1d017749
sudo system enbale bluetooth
sudo system restart bluetooth
sudo systemctl status bluetooth
 
<<<<<<< HEAD
sudo bluetoothctl -v 
```


#https://github.com/ftonello/bluez
1. run bootstrap-confifgure

#links for midi bLE
https://mclarenlabs.com/blog/2019/01/15/korg-microkey-air-37-bluetooth-midi-keyboard-with-raspberry-pi/
https://mclarenlabs.com/blog/2018/07/03/linux-midi-cheatsheet/
#some commands
```
sudo btmon
 aplaymidi -l
 aconnect -lio
 aconnect -i -o -l
 
 aseqdump -p 128:0
 cat /proc/asound/seq/clients
```
 
#TO test
 https://community.blokas.io/t/script-for-launching-pd-patch-with-midi-without-aconnect/1010/3?u=amazingrolo
 
 https://blokas.io/patchbox-os/docs/amidiauto/
``` 
puredata -stderr -nogui -alsa -audioadddev pisound -alsamidi -channels 2 -r 48000 -mididev 1 mypatch.pd $@ &
```
``` 
sleep 3 aconnect 'Teensy MIDI':0 'Pure Data':0
```

https://forum.pdpatchrepo.info/topic/11684/midi-controller-not-seen-by-pd-but-seen-by-system-rpi3-pd-49/3

```
aconnect 20:0 128:0

this connected my controller (20) to Pd (128)
````

#Try Jack VErsion for midi
```
https://linuxmusicians.com/viewtopic.php?t=19092
```

#Arduino
ls -l /dev/tty.usb*
sudo screen /dev/tty.usbmodem1421 115200


#Mstartup
```
pd -oss -nrt -nogui  -alsamidi -mididev 1  -r 44100 -blocksize 32 -audiobuf 10 ./puredata_file/LooperUndoExtened.pd
```






=======
bluetoothctl
>>>>>>> 9bd26d3388d155ecd64d73d50f6c30fb1d017749
