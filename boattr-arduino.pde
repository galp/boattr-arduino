int deviceAddress = 0x21;
int sensorValue = 0; 
int analogPinsCount = 16; 

#include <Wire.h>

void readAnalogPins()
{
  int data[analogPinsCount];
  Serial.println("I2C Master called me...");
  for (int i=0; i < analogPinsCount; i++){
    data[i] = analogRead(i);
    Serial.println(String(data[i]));
  }
  Wire.write((byte *) &data, sizeof data);
}

void setup()
{
  pinMode(1, OUTPUT);
  Wire.begin(deviceAddress);       
  Wire.onRequest(readAnalogPins);
  Serial.begin(9600); 
}

void loop()
{
  delay(2000);
}


