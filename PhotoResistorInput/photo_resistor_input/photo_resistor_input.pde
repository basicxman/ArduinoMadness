/*
 * @author: Andrew Horsman
 * @description: Shines an LED at a brightness corresponding with
 * the photo resistor.
 */
 
const int LIGHT_INPUT_PIN = 0;
const int LED_OUTPUT_PIN  = 9;

void setup() {
  pinMode(LED_OUTPUT_PIN, OUTPUT); 
  Serial.begin(9600);
}

void loop() {
   int inputBrightness = map(analogRead(LIGHT_INPUT_PIN), 0, 900, 0, 255);
   inputBrightness = constrain(inputBrightness, 0, 255);
   
   Serial.println(inputBrightness, DEC);
  
   analogWrite(LED_OUTPUT_PIN, inputBrightness); 
}
