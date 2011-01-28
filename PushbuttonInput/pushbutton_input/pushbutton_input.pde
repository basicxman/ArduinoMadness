/*
 * @author: Andrew Horsman
 * @description: Push button input.
 */
 
const int LED_PIN = 13;

const int LEFT_BUTTON_PIN  = 2;
const int RIGHT_BUTTON_PIN = 3;

const int LEFT  = 0;
const int RIGHT = 1;
int previousState[2];
int currentState[1];

void InitializePins() {
  pinMode(LED_PIN, OUTPUT);
 
  pinMode(LEFT_BUTTON_PIN, INPUT);
  pinMode(RIGHT_BUTTON_PIN, INPUT); 
}

void setup() {
  InitializePins();
 
  currentState[LEFT]    = digitalRead(LEFT_BUTTON_PIN);
  currentState[RIGHT]   = digitalRead(RIGHT_BUTTON_PIN);
  previousState[LEFT]   = currentState[LEFT];
  previousState[RIGHT]  = currentState[RIGHT]; 
}

void loop() {
  
}


