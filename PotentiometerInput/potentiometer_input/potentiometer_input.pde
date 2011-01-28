/*
 * @author: Andrew Horsman
 * @description: Blinks an LED with speed based on the position
 * of the potentiometer.  Prints the pot's position in percentile
 * on serial.
 */
 
// Notes:
// The potentiometer is on an analog input-only pin, therefore
// the pin mode does not need to be set.
 
const int POTENTIOMETER_PIN = 0;
const int LED_PIN = 13;

const float RANGE = 1023;

unsigned int counter = 0;
int ledState = LOW;

void ledBlink(int speed) {
  ++counter;
  if (counter >= speed) {
    counter = 0;
    ledState = (ledState == LOW) ? HIGH : LOW; 
    digitalWrite(LED_PIN, ledState);
  }
}

int GetPotValue() {
  return analogRead(POTENTIOMETER_PIN); 
}

float positionInPercentile() {
   return (GetPotValue() / RANGE) * 100;
}

void setup() {
  pinMode(LED_PIN, OUTPUT); 
  Serial.begin(115200);
}

void loop() {
  Serial.print("Potentiometer Position: ");
  Serial.print(positionInPercentile(), DEC);
  Serial.print(" Counter: ");
  Serial.println(counter, DEC);
  
  ledBlink(GetPotValue() / 4);
  
  delayMicroseconds(1);
}
