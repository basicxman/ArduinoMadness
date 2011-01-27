/*
 * @author: Andrew Horsman
 * @description: Controls a servo motor.
 */
 
#include <Servo.h>

const int SERVO_PORT = 9;

const int SERVO_POSITION_TOLERANCE = 0;
const int SERVO_HOME_POSITION      = 90;

Servo mainServo;
int   currentPosition;

void ResetServoPosition() {
  currentPosition = 0; 
}

void AttachServo() {
  mainServo.attach(SERVO_PORT);
  ResetServoPosition(); 
}

bool ServoInPosition(int position) {
  int minValue = position - SERVO_POSITION_TOLERANCE;
  int maxValue = position + SERVO_POSITION_TOLERANCE;
 
  return (mainServo.read() > minValue && mainServo.read() < maxValue); 
}

void SetServoHome() {
  if (mainServo.attached()) 
    mainServo.write(SERVO_HOME_POSITION);
    
  while (!ServoInPosition(SERVO_HOME_POSITION)) 
    delayMicroseconds(100);
}

void OscillateServo() {}

void setup() {
  AttachServo(); 
  SetServoHome();
}

void loop() {
  OscillateServo();
}
