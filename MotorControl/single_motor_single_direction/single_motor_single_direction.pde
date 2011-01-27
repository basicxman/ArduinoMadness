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
 
 void motorSweep(int accelerationDuration, int decelerationDuration, int holdDuration) {
   int delayTime = accelerationDuration / 255; 
   for (int speed = 0; speed <= 255; ++speed) {
     analogWrite(MOTOR_PIN, speed);
     delay(delayTime); 
   }
   
   delay(holdDuration);
   
   delayTime = decelerationDuration / 255;
   for (int speed = 255; speed >= 0; --speed) {
     analogWrite(MOTOR_PIN, speed);
     delay(delayTime); 
   }
 }
 
 void setup() {
   pinMode(MOTOR_PIN, OUTPUT); 
 }
 
 void loop() {
   motorSweep(2000, 2000, 1000);
 }
