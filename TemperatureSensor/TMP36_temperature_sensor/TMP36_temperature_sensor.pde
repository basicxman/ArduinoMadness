/*
 * @author: Andrew Horsman
 * @description: Measures temperature with the TMP36 temperature
 * sensor. http://www.analog.com/en/temperature-sensing-and-thermal-management/digital-temperature-sensors/tmp36/products/product.html
 *
 * Outputs 10mV/C with a 500mV offset.
 */
 
const int TEMPERATURE_SENSOR_PIN = 0;

/*
 * Gets the analog reading from the sensor pin, then converts the
 * 0 to 1023 value returned from analogRead to mV.
 */
float getmV() {
  float rawValue = analogRead(TEMPERATURE_SENSOR_PIN);
  return rawValue * 4.882814;  
}

float GetTemperature() {
  return (getmV() - 500) / 10;
}

float ConvertToFahrenheit(float celsius) {
  float fahrenheit = celsius * 9;
  fahrenheit /= 5;
  fahrenheit += 32;
 
  return fahrenheit; 
}

void setup() {
  Serial.begin(9600); 
}

void loop() {
  float degreesCelsius = GetTemperature();
  float degreesFahrenheit = ConvertToFahrenheit(degreesCelsius);
  
  Serial.print(degreesCelsius, DEC);
  Serial.print("*C  ");
  Serial.print(degreesFahrenheit, DEC);
  Serial.println("*F");
 
  delay(300); 
}
