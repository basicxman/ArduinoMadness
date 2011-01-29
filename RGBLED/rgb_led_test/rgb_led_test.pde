/*
 * @author: Andrew Horsman
 * @description: Operates a RGB LED.
 */
 
const int RED_PIN   = 9;
const int GREEN_PIN = 10;
const int BLUE_PIN  = 11;

void setup() {
  
}

void loop() {
  analogWrite(RED_PIN, 255);
  delay(1000);
  analogWrite(RED_PIN, 0);
  analogWrite(GREEN_PIN, 255);
  delay(1000);
  analogWrite(GREEN_PIN, 0);
  analogWrite(BLUE_PIN, 255); 
  delay(1000);
  analogWrite(BLUE_PIN, 0);
}
