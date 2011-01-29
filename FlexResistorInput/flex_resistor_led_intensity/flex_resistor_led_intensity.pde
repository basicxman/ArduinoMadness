/*
 * @author: Andrew Horsman
 * @description: Controls an RGB LED intensity via a flex sensor.
 */
 
const int RED_PIN   = 9;
const int GREEN_PIN = 10;
const int BLUE_PIN  = 11;

const int FLEX_PIN = 0;

void setup() {
  Serial.begin(9600); 
}

void loop() {
  int flexValue = analogRead(FLEX_PIN);
  
  Serial.print("Flex sensor reading: ");
  Serial.println(flexValue, DEC);
  
  flexValue = map(flexValue, 100, 280, 0, 255);
  flexValue = constrain(flexValue, 0, 255);
  
  analogWrite(RED_PIN, flexValue);
  analogWrite(GREEN_PIN, flexValue);
  analogWrite(BLUE_PIN, flexValue);
}
