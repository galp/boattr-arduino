int deviceAddress = 0x20;
int sensorPin = A0; 
int sensorValue = 0; 

#include <Wire.h>

// function that executes whenever data is requested by master
// this function is registered as an event, see setup()
void requestEvent()
{
  sensorValue = analogRead(sensorPin);
  Wire.write(sensorValue); 
}

void readAnalogPins()
{
  Serial.println("Master asked for results...");
  for (int i=0; i <= 4; i++){
    int result = analogRead(i);
    //Serial.print(":  ");
    //Serial.print(result);
    //Serial.print("\t");
    Wire.write(result); 
  }
}
void setup()
{
  Wire.begin(deviceAddress);       
  Wire.onRequest(readAnalogPins);
  Serial.begin(9600); 
}


void loop()
{
  Serial.println('In a loop waiting for I2C master to ask for me');
  delay(1000);
}


