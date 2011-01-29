/*
 * @author: Andrew Horsman
 * @description: Operates a RGB LED.
 */
 
const int RED_PIN   = 9;
const int GREEN_PIN = 10;
const int BLUE_PIN  = 11;

void DisplayRGB(int red = 0, int green = 0, int blue = 0) {
  analogWrite(RED_PIN, red);
  analogWrite(GREEN_PIN, green);
  analogWrite(BLUE_PIN, blue);
}

void setup() {
  
}

void loop() {
 
}
