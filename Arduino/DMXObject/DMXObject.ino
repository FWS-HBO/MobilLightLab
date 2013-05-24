
 
 char recBuffer[4];
 boolean h11,h10,h13; 

 
 void setup() {
   pinMode(11, OUTPUT); // Set pin as OUTPUT
   pinMode(10,OUTPUT);
   Serial.begin(9600); // Start serial communication at 9600 bps
   Serial.setTimeout (100);
 }
 
 void loop() {
   if (Serial.available()) { 
     Serial.readBytes(recBuffer, 4);
   }
   h10=recBuffer[0];
   h11=recBuffer[1];
   h13=recBuffer[2]<127;
  analogWrite(11,h11);
   analogWrite(10,h10);
   digitalWrite(13,h13);
 }
 
 
 
