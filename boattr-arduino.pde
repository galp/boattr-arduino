int deviceAddress = 0x20;
int sensorValue = 0; 
int analogPinsCount = 4; 

#include <Wire.h>

void readAnalogPins()
{
  byte data[analogPinsCount];
  Serial.println("I2C Master called me...");
  for (int i=0; i < analogPinsCount; i++){
    data[i] = analogRead(i);
    Serial.println(String(data[i]));
  }
  Wire.write((byte *) &data, sizeof data);


}
void setup()
{
  Wire.begin(deviceAddress);       
  Wire.onRequest(readAnalogPins);
  Serial.begin(9600); 
}


void loop()
{
  //Serial.println("In a loop waiting for I2C master to ask for me");
  delay(1000);
}


