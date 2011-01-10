/*
 * @author: Andrew Horsman
 * @description: Basic LED flashing.
 */

// Flash speeds. 
const int SLUGGISH = 2000;
const int SLOW     = 1500;
const int MEDIUM   = 1000;
const int FAST     = 500;
const int RAPID    = 100;

// Ports
const int LED      = 13;

// Program
void ledOn() {
  digitalWrite(LED, HIGH);
}

void ledOff() {
   digitalWrite(LED, LOW); 
}

void setup() {
  pinMode(LED, OUTPUT); 
}

void loop() {
  ledOn();
  delay(MEDIUM);
  ledOff();
  delay(MEDIUM);
}
