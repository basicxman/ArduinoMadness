/*
 * @author: Andrew Horsman
 * @description: Tests a resistance touch soft potentiometer.
 */
 
const int POTENTIOMETER_PIN = 0;

void setup() {
  Serial.begin(9600); 
}

void loop() {
  Serial.println(analogRead(POTENTIOMETER_PIN), DEC);
  
  delay(20);
}
