/*
 * @author: Andrew Horsman
 * @description: Controls a servo motor without the standard
 *   library.
 */
 
const int SERVO_PORT = 9;

const int   LOWER_MICROSECOND_BOUND = 900;
const int   UPPER_MICROSECOND_BOUND = 2100;
const float SCALING_FACTOR          = 6.666666666666667;

int CalculateMicrosecondDelay(int degreeSetpoint) {
  int microsecondsToReturn = degreeSetpoint * SCALING_FACTOR;
  microsecondsToReturn    += LOWER_MICROSECOND_BOUND;
  
  return microsecondsToReturn;
}

void setup() {
  pinMode(SERVO_PORT, OUTPUT); 
}

void loop() {
   for (int setpoint = 20; setpoint < 160; ++setpoint)  {
     digitalWrite(SERVO_PORT, HIGH);
     delayMicroseconds(CalculateMicrosecondDelay(setpoint));
     digitalWrite(SERVO_PORT, LOW);
     delay(25);
   }
}
