/*
 * @author: Andrew Horsman
 * @description: Push button input.
 */
 
const int LED_PIN = 13;

const int LEFT_BUTTON_PIN  = 2;
const int RIGHT_BUTTON_PIN = 3;

int currentState[4];
int previousState[4];
int ledState = LOW;

void InitializePins() {
  pinMode(LED_PIN, OUTPUT);
 
  pinMode(LEFT_BUTTON_PIN, INPUT);
  pinMode(RIGHT_BUTTON_PIN, INPUT); 
}

bool HasButtonBeenPressed(int button) {
  previousState[button] = currentState[button];
  currentState[button]  = digitalRead(button);
  
  return (previousState[button] == LOW && currentState[button] == HIGH);
}

void ToggleLED() {
  ledState = (ledState == HIGH) ? LOW : HIGH; 
  digitalWrite(LED_PIN, ledState);
}

void setup() {
  InitializePins();
}

void loop() {
  if (HasButtonBeenPressed(LEFT_BUTTON_PIN) || HasButtonBeenPressed(RIGHT_BUTTON_PIN))
    ToggleLED();
}


