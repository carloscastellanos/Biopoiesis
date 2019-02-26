/* 
ARDUINO / MAX HANDSHAKE MESSAGING PROTOCOL

Messaging protocol:

r a [$pin] = read analog inputs (reads all analog ins if $pin is not specified)
r d [$pin] = read digital inputs (reads all digital ins if $pin is not specified)
r a [$start_pin] [$end_pin] = read from $start_pin to $end_pin
r d [$start_pin] [$end_pin] = read from $start_pin to $end_pin
r p [$pin] = count pulses on $pin (counts pulses on all digital ins if $pin is not specified)
r p [$pin] = count pulses from $start_pin to $end_pin

w a [$pin] [$duty] = write analog (writes to specified pwm pin - $pin and $duty are required)
w d [$pin] [$value] = write digital (writes to specified  pin - $pin and $value are required)
w a [$start_pin] [$end_pin] [$duty] = write analog from $start_pin to $end_pin at specified $duty
w d [$start_pin] [$end_pin] = write digitl  from $start_pin to $end_pin

p m [$pin] [$value] = set pin mode


default seperator is a space
carriage return (ASCII 13) ends message
 */

#include <Messenger.h>

// Instantiate Messenger object with the message function and the default separator (the space character)
#include "WProgram.h"
void messageReceived();
void setup();
void loop();
Messenger message = Messenger();


long previousMillis = 0;        // this is for
long interval = 5000;           // creating a delay
boolean first = true;

// Define messenger function
void messageReceived() {
  if ( message.checkString("r") ) { // Read pins (analog or digital)
    if ( message.checkString("a") ) {
      int pin = message.readInt();
      
      //delay
      while(true) {
        if(millis() - previousMillis > interval) {
          if(!first) {
            previousMillis = millis();
            break;
          } else {
            first = false;
          }
        }
      }
      Serial.print("a "); //
      Serial.print(pin, DEC);
      Serial.print(" ");
      Serial.print(analogRead(pin),DEC); // read analog in and send it
      Serial.println(); // Terminate message
    }
  } 
  else if ( message.checkString("w") ) { // Write pin (analog or digital)
    if ( message.checkString("a") ) {
      int pin = message.readInt();
      int value = message.readInt();
      analogWrite(pin,value); //Sets the PWM of the pin
    } else if( message.checkString("d") ) {
      int pin = message.readInt();
      int state = message.readInt();
      digitalWrite(pin, state);
    }
  }
}

void setup() {
  for(int i=3; i <= 13; i++) {
    pinMode(i, OUTPUT);
    digitalWrite(i, LOW);
  }
  // Initiate Serial Communication
  Serial.begin(115200); 
  message.attach(messageReceived);
}

void loop() {
  // The following line is the most effective way of 
  // feeding the serial data to Messenger
  while ( Serial.available( ) ) message.process(Serial.read( ) );
  /*
  for(int i=3; i <= 13; i++) {
    pinMode(i, OUTPUT);
    digitalWrite(i, LOW);
  }*/
}



int main(void)
{
	init();

	setup();
    
	for (;;)
		loop();
        
	return 0;
}

