int deviceAddress = 0x20;

#include <Wire.h>

// function that executes whenever data is requested by master
// this function is registered as an event, see setup()
void requestEvent()
{
  Wire.write("hello "); // respond with message of 6 bytes
                       // as expected by master
}

void setup()
{
  Wire.begin(deviceAddress);       
  Wire.onRequest(requestEvent);
  Serial.begin(9600);  
}


void loop()
{
  delay(100);
}


