/*
 * @author: Andrew Horsman
 * @description: Basic LED fade in/out.
 */
 
// Flash speeds.
const int FLASH_SLUGGISH = 2000;
const int FLASH_SLOW     = 1500;
const int FLASH_MEDIUM   = 1000;
const int FLASH_FAST     = 500;
const int FLASH_RAPID    = 100;

// Fade speeds.
const int FADE_SLUGGISH  = 1;
const int FADE_SLOW      = 2;
const int FADE_MEDIUM    = 5;
const int FADE_FAST      = 25;
const int FADE_RAPID     = 50;
 
const int a_LED = 9;
 
// Program
void ledOn(int fadeSpeed, int duration) {
  int numberOfCycles = 255 / fadeSpeed;
  int delayDuration  = duration / numberOfCycles;
  for (int brightness = 0; brightness < 255; brightness += fadeSpeed) {
     analogWrite(a_LED, brightness);
     delay(delayDuration);
  }
}

void ledOff(int fadeSpeed, int duration) {
  int numberOfCycles = 255 / fadeSpeed;
  int delayDuration  = duration / numberOfCycles;
  for (int brightness = 255; brightness > 0; brightness -= fadeSpeed) {
    analogWrite(a_LED, brightness);
    delay(delayDuration);
  }
}

void setup() {
  pinMode(a_LED, OUTPUT); 
}

void loop() {
  ledOn(FADE_SLOW, FLASH_MEDIUM);
  delay(FLASH_MEDIUM);
  ledOff(FADE_SLOW, FLASH_MEDIUM);
  delay(FLASH_MEDIUM);
}
