/*
 * @author: Andrew Horsman
 * @description: Flash LED's in random order.
 */
 
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

void setup() {
   seed();
}
