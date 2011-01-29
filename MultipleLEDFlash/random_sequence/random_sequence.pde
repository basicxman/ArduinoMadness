/*
 * @author: Andrew Horsman
 * @description: Flash LED's in random order.
 */
 
const int NUM_LEDS       = 8;
const int LEDS[NUM_LEDS] = {2, 3, 4, 5, 6, 7, 8, 9};
 
// Program
void seed() {
  Serial.begin(9600);
  randomSeed(analogRead(0)); // RX port makes a perfect seed :D 
}

void setLEDsToOutput() {
  for (int i = 0; i < NUM_LEDS; ++i) {
    pinMode(LEDS[i], OUTPUT); 
  }
}  

void setAllLEDsOff() {
  for (int i = 0; i < NUM_LEDS; ++i) {
    digitalWrite(LEDS[i], LOW);
  } 
}

void DoSequence() {
  int numLEDsToTurnOn = random(0, NUM_LEDS);
 
  for (int i = 0; i < numLEDsToTurnOn; ++i) {
    int ledPin = LEDS[random(0, NUM_LEDS)];
    digitalWrite(ledPin, HIGH);
  } 
  delay(400);
}

void setup() {
   seed();
}

void loop() {
  DoSequence(); 
}
