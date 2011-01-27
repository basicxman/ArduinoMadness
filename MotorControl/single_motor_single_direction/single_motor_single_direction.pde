/*
 * @author: Andrew Horsman
 * @description: Single direction motor control using a 
 *   diode and NPN transistor.
 */
 
 const int MOTOR_PIN = 9;
 
 void motorPulse(int onDuration, int offDuration) {
   digitalWrite(MOTOR_PIN, HIGH);
   delay(onDuration);
   digitalWrite(MOTOR_PIN, LOW);
   delay(offDuration);
 }
 
 void setup() {
   pinMode(MOTOR_PIN, OUTPUT); 
 }
 
 void loop() {
   motorPulse(1000, 1000);
 }
