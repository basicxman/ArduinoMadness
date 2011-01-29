/*
 * @author: Andrew Horsman
 * @description: Operates a RGB LED.
 */
 
#define RED DisplayRGB(255, 0, 0) 
#define GREEN DisplayRGB(0, 255, 0)
#define BLUE DisplayRGB(0, 0, 255)
#define WHITE DisplayRGB(255, 255, 255)
#define CYAN DisplayRGB(0, 255, 255)
#define AIR_FORCE_BLUE DisplayRGB(36, 54, 66)
#define AMBER DisplayRGB(100, 75, 0)
#define APPLE_GREEN DisplayRGB(55, 71, 0)
#define BABY_BLUE DisplayRGB(54, 81, 94)
#define BRIGHT_PINK DisplayRGB(100, 0, 50)
#define BROWN DisplayRGB(59, 29, 0)
 
const int RED_PIN   = 9;
const int GREEN_PIN = 10;
const int BLUE_PIN  = 11;

const int RX_PORT = 0;

void DisplayRGB(int red = 0, int green = 0, int blue = 0) {
  analogWrite(RED_PIN, red);
  analogWrite(GREEN_PIN, green);
  analogWrite(BLUE_PIN, blue);
}

int Rand() {
  return random(0, 256); 
}

void DisplayRandom(bool withSerialOutput = false) {
  int red = Rand(); 
  int green = Rand(); 
  int blue = Rand();
  
  if (withSerialOutput) {
    Serial.print("Red: ");
    Serial.print(red, DEC);
    Serial.print(" Green: ");
    Serial.print(green, DEC);
    Serial.print(" Blue: ");
    Serial.println(blue, DEC);
  }
  
  DisplayRGB(red, green, blue);
}

void LoopRandom(int duration) {
  DisplayRandom(true);
  delay(duration); 
}

void LoopAlternate(int duration) {
  Serial.println("Red");
  RED;
  delay(duration);
  Serial.println("Green");
  GREEN;
  delay(duration);
  Serial.println("Blue");
  BLUE;
  delay(duration);
  Serial.println("White");
  WHITE; 
  delay(duration);
  Serial.println("Cyan");
  CYAN;
  delay(duration);
  Serial.println("Air Force Blue");
  AIR_FORCE_BLUE;
  delay(duration);
  Serial.println("Amber");
  AMBER;
  delay(duration);
  Serial.println("Apple Green");
  APPLE_GREEN;
  delay(duration);
  Serial.println("Baby Blue");
  BABY_BLUE;
  delay(duration);
  Serial.println("Bright Pink");
  BRIGHT_PINK;
  delay(duration);
  Serial.println("Brown");
  BROWN;
  delay(duration);
}

void setup() {
  Serial.begin(9600); 
  randomSeed(analogRead(RX_PORT));
}

void loop() {
  LoopAlternate(400);
  for (int i = 0; i < 3; ++i) 
    LoopRandom(400);
  LoopAlternate(400);
}
