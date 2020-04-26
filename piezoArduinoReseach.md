#to test peak piezo arduio 


```
// knock sensor/alarm
// Piezo, with 1Megohm load resistor across, connected to A0 and ground
// optional 5volt buzzer on pin 13

int threshold = 100; // alarm threshold from 1 (very sensitive) to 1022 <<<<<<<<
int alarmDuration = 100; // alarm duration in milliseconds <<<<<<<<

const byte piezoPin = A0;
int rawValue; // raw A/D readings
int piezoValue; // peak value
const byte onboardLED = 13; // onboard LED and/or buzzer

void setup() {
  //analogReference(INTERNAL); // remove this line if too sensitive
  Serial.begin(115200); // serial monitor for raw piezo output
  pinMode (onboardLED, OUTPUT);
}

void loop() {
  // reset
  piezoValue = 0;
  // read
  for (int x = 0; x < 250; x++) { // multiple A/D readings
    rawValue = analogRead(piezoPin);
    if (rawValue > piezoValue) {
      piezoValue = rawValue; // store peaks
    }
  }
  // print
  if (piezoValue > 0) {
    Serial.print(F("Piezo value is "));
    Serial.println(piezoValue);
  }
  // action
  if (piezoValue > threshold) {
    Serial.print(F("Knock was over the threshold of "));
    Serial.println(threshold);
    digitalWrite (onboardLED, HIGH);
    delay(alarmDuration);
    digitalWrite (onboardLED, LOW);
  }
}
```


#Working Piezo
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


int sensorReading1 = 0; 
int sensorReading2 = 0; 
int velocity1 = 100;//velocity of MIDI notes, must be between 0 and 127
int velocity2 = 100;//velocity of MIDI notes, must be between 0 and 127
 //higher velocity usually makes MIDI instruments louder
 const int knockSensor = A0;
 const int knockSensor2 = A1;
 int noteON = 144;//144 = 10010000 in binary, note on command
 int noteOFF = 128;//128 = 10000000 in binary, note off command

 const int threshold1 = 30;
 const int threshold2 = 10;
 const int threshold3 = 10;
 const int notes []   = {44, 45, 46, 47, 48, 49, 50 ,51,52,53,55,41,41,41,41,41,41,41,41,41};
 const int notesnare [] = {37, 38};
 int note = 36;
 int triggerA1 = 0;
 int triggerA2 = 0;

 

void setup() {
  //  Set MIDI baud rate:
 
  Serial.begin(31250);
}

void loop() {



  
   sensorReading1 = analogRead(knockSensor);
   sensorReading2 = analogRead(knockSensor2);
   
 if (sensorReading1 >= threshold1 &&  sensorReading2 <= threshold2) {
      
        velocity1 = constrain(sensorReading1, 0, 100);
       
       MIDImessage(noteON, 36, velocity1 -5 );//turn note on
       delay(10);//hold note for 300ms
       MIDImessage(noteOFF, 36, 0);//turn note off
       delay(10);//wait 200ms until triggering next note
       triggerA1 = 0;
      
    } else if (sensorReading1 >= threshold1 &&  sensorReading2 >= threshold2)
    {
      velocity1 = constrain(sensorReading1, 0, 100);
      velocity2 = constrain(sensorReading2, 0, 100);

      
       note     = notesnare[random (0, 2)];
       MIDImessage(noteON, 36, velocity1 -5 );//turn note on
       MIDImessage(noteON, note, velocity2 -5 );//turn note on
       delay(10);//hold note for 300ms
       MIDImessage(noteOFF, 36, 0);//turn note off
       MIDImessage(noteOFF, note, 0);//turn note off
       delay(10);//wait 200ms until triggering next note
     
      
      
      } else if (sensorReading1 <= threshold1 &&  sensorReading2 >= threshold2) {


         velocity2 = constrain(sensorReading2, 0, 100);
         //note     = notes[random (0, 5)];
         note     = notesnare[random (0, 2)];
     
       MIDImessage(noteON, note, velocity2 -5 );//turn note on
       delay(10);//hold note for 300ms
       MIDImessage(noteOFF, note, 0);//turn note off
       delay(10);//wait 200ms until triggering next note
        
        
        
        } else if (sensorReading1 >= threshold3 ) {

          velocity1 = constrain(sensorReading1, 0, 100);

          note     = notes[random (0, 20)];
         
     
       MIDImessage(noteON, note, velocity1 - 5 );//turn note on
       delay(10);//hold note for 300ms
       MIDImessage(noteOFF, note, 0);//turn note off
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