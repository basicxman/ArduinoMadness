/*
 * @author: Andrew Horsman
 * @description: Controls eight LED's via a shift register.
 */
 
// Sequence speeds. 
const int SLUGGISH = 2000;
const int SLOW     = 1500;
const int MEDIUM   = 1000;
const int FAST     = 500;
const int RAPID    = 100;
 
// Pins.
const int DATA_PORT  = 2;
const int CLOCK_PORT = 3;
const int LATCH_PORT = 4;

void SetShiftRegisterPins() {
  pinMode(DATA_PORT, OUTPUT);
  pinMode(CLOCK_PORT, OUTPUT);
  pinMode(LATCH_PORT, OUTPUT); 
}

void TurnOnLatch()  { digitalWrite(LATCH_PORT, LOW);  }
void TurnOffLatch() { digitalWrite(LATCH_PORT, HIGH); }

void SetShiftRegister(byte bitsToSend) { shiftOut(DATA_PORT, CLOCK_PORT, MSBFIRST, bitsToSend); }

void SetAllLEDsOff() {
  byte allLEDsOff = 0;
  for (int bitLED = 0; bitLED < 8; ++bitLED) 
    bitWrite(allLEDsOff, bitLED, LOW);
  
  TurnOffLatch();  
  SetShiftRegister(allLEDsOff);
  TurnOnLatch();
}

void IncomingSequence(int speed) {
  int leftCounter  = 0;
  int rightCounter = 7;
 
  while (leftCounter < rightCounter) {
    SetAllLEDsOff();
    
    byte LEDsOn = 0;
    bitWrite(LEDsOn, leftCounter, HIGH);
    bitWrite(LEDsOn, rightCounter, HIGH);
    
    TurnOffLatch();
    SetShiftRegister(LEDsOn);
    TurnOnLatch();
    
    leftCounter++;
    rightCounter--;
    
    delay(speed);
  } 
}

void setup() {
  SetShiftRegisterPins(); 
}

void loop() {
  IncomingSequence(SLOW);
}
