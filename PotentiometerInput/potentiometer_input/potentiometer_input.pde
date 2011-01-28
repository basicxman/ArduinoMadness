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

void ledBlink(int speed) {
  digitalWrite(LED_PIN, HIGH);
  delay(speed);
  digitalWrite(LED_PIN, LOW);
  delay(speed); 
}

int GetPotValue() {
  return analogRead(POTENTIOMETER_PIN); 
}

float positionInPercentile() {
   return (GetPotValue() / RANGE) * 100;
}

void setup() {
  pinMode(LED_PIN, OUTPUT); 
  Serial.begin(9600);
}

void loop() {
  Serial.print("Potentiometer Position: ");
  Serial.println(positionInPercentile(), DEC);
  
  ledBlink(GetPotValue());
  
  delay(20);
}
