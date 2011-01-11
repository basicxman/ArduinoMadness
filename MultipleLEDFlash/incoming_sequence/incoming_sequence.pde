/*
 * @author: Andrew Horsman
 * @description: Flahes multiple LED's in an incoming sequence.
 */
 
const int NUM_LEDS       = 8;
const int LEDS[NUM_LEDS] = {2, 3, 4, 5, 6, 7, 8, 9};

// Sequence speeds. 
const int SLUGGISH = 2000;
const int SLOW     = 1500;
const int MEDIUM   = 1000;
const int FAST     = 500;
const int RAPID    = 100;

// Program
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

void initiateSequence(int sequenceSpeed) {
  int leftCounter       = 0;
  int rightCounter      = NUM_LEDS - 1;
  // Once at the center LED's, sequence is finished.
  while (leftCounter < rightCounter) {
    setAllLEDsOff();
    
    digitalWrite(LEDS[leftCounter], HIGH);
    digitalWrite(LEDS[rightCounter], HIGH);
    
    leftCounter++;
    rightCounter--;
    
    delay(sequenceSpeed);
  }
}

void setup() {
  setLEDsToOutput(); 
}

void loop() {
  initiateSequence(MEDIUM); 
  for (int i = 0; i < 20; ++i) 
    initiateSequence(RAPID);
}
