/*
 * @author: Andrew Horsman
 * @description: Flashes multiple LED's in a consecutive sequence.
 */
 
const int NUM_LEDS      = 8;
const int LEDS[NUM_LEDS] = {2, 3, 4, 5, 6, 7, 8, 9};

// Program
void setLEDsToOutput() {
  for (int i = 0; i < NUM_LEDS; ++i) {
    pinMode(LEDS[i], OUTPUT); 
  }
}

int wrap(int number) {
  if (number > NUM_LEDS)
    return 0;
  else if (number < 0)
    return NUM_LEDS - 1;
  else
    return number;
}  

void initiateSequence() {
   for (int i = 0; i < NUM_LEDS; ++i) {
      digitalWrite(LEDS[wrap(i - 1)], LOW);
      digitalWrite(LEDS[i], HIGH);
      delay(300);
   }
}  

void setup() {
  setLEDsToOutput(); 
}

void loop() {
  initiateSequence();
}
