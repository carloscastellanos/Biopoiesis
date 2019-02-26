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
Messenger message = Messenger();


//long previousMillis = 0;        // this is for
//long interval = 1000;           // creating a delay

// Define messenger function
void messageReceived() {
  if ( message.checkString("r") ) { // Read pins (analog or digital)
    if ( message.checkString("a") ) {
      int pin = message.readInt();
      
      // ---- delay ----
//      if(pin==2) { // the first read msg from Max/MSP
//        previousMillis = millis(); //"reset" counter to 0 before starting
//        while(true) {
//          if(millis() - previousMillis >= interval) {
//            previousMillis = millis(); //"reset" counter to 0
//            break;
//          }
//        } // end while
//      }
      // ---- end delay ----
      
      Serial.print("a "); //
      Serial.print(pin, DEC);
      Serial.print(" ");
      Serial.print(analogRead(pin),DEC); // read analog in and send it
      Serial.println(); // Terminate message
    }
    //delay(1);
  } 
  else if ( message.checkString("w") ) { // Write pin (analog or digital)
    if ( message.checkString("a") ) {
      int pin = message.readInt();
      int value = message.readInt();
      analogWrite(pin,value); //Sets the PWM of the pin
    } else if( message.checkString("d") ) {
        //int pin;
//        if( message.checkString("a0") )
//          pin = A0;
//        else if( message.checkString("a1") )
//          pin = A1;
//        else if( message.checkString("a2") )
//          pin = A2;
//        else if( message.checkString("a3") )
//          pin = A3;
//        else
          //pin = message.readInt();
      
      int pin = message.readInt();
      int state = message.readInt();
      if (pin == 14)
        digitalWrite(A0, state);
      else if (pin == 15)
        digitalWrite(A1, state);
      else if (pin == 16)
        digitalWrite(A2, state);
      else if (pin == 17)
        digitalWrite(A3, state);
      else
        digitalWrite(pin, state);
    }
  }
}

void setup() {
  // set digital pins as outputs and set them to LOW
  for(int i=2; i <= 13; i++) {
    pinMode(i, OUTPUT);
    digitalWrite(i, LOW);
  }
  // set analog ins 0-3 to digital outs and set them to LOW
  pinMode(A0, OUTPUT);
  digitalWrite(A0, LOW);
  pinMode(A1, OUTPUT);
  digitalWrite(A1, LOW);
  pinMode(A2, OUTPUT);
  digitalWrite(A2, LOW);
  pinMode(A3, OUTPUT);
  digitalWrite(A3, LOW);
  // Initiate Serial Communication
  Serial.begin(115200); 
  message.attach(messageReceived);
}

void loop() {
  // The following line is the most effective way of 
  // feeding the serial data to Messenger
  while ( Serial.available( ) ) {
    message.process(Serial.read( ) );
    delay(10);
  }
  /*
  for(int i=3; i <= 13; i++) {
    pinMode(i, OUTPUT);
    digitalWrite(i, LOW);
  }*/
}


