/*
 * @author: Andrew Horsman
 * @description: Controls a servo motor with the standard library.
 */
 
#include <Servo.h>

const int SERVO_PORT = 9;

const int SERVO_POSITION_TOLERANCE = 0;
const int SERVO_HOME_POSITION      = 90;

Servo mainServo;

void AttachServo() {
  mainServo.attach(SERVO_PORT);
}

bool IsServoInPosition(int position) {
  int minValue = position - SERVO_POSITION_TOLERANCE;
  int maxValue = position + SERVO_POSITION_TOLERANCE;
 
  return (mainServo.read() >= minValue && mainServo.read() <= maxValue); 
}

void WaitUntilInPosition(int position) {
  while (!IsServoInPosition(position))
    delayMicroseconds(100); 
}

void SetServoHome() {
  if (mainServo.attached()) 
    mainServo.write(SERVO_HOME_POSITION);
    
  WaitUntilInPosition(SERVO_HOME_POSITION);
}

void OscillateServo() {
  if (mainServo.attached()) {
    int setpoint;
    
    for (int offset = 1; offset < 70; ++offset) {
      for (int i = 0; i < 2; ++i) {
        Serial.print("Current setpoint: ");
        Serial.println(setpoint, DEC);
        setpoint = SERVO_HOME_POSITION + offset;
        mainServo.write(setpoint);
        WaitUntilInPosition(setpoint);
        delay(300);
        
        Serial.print("Current setpoint: ");
        Serial.println(setpoint, DEC);
        setpoint = SERVO_HOME_POSITION - offset;
        mainServo.write(setpoint);
        WaitUntilInPosition(setpoint);
        delay(300);
      }
    }
  }
}

void setup() {
  Serial.begin(9600);
  AttachServo(); 
  SetServoHome();
}

void loop() {
  OscillateServo();
}
