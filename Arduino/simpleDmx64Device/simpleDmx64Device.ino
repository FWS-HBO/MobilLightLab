/*
Programm Name:    simpleDmx64Device Version 0.1
Zweck:            
  es wird über die serielle Schnittstelle ein DMX Frame (9600,32 Byte) empfangen
  welcher zB. vom PC über den Processing Scetch "SimpleDMXGUI 0.1" gesendet wird.
  der empfangene DMX-Frame wird in ein array (recBuffer) abgespeichert.
  Hiervon werden die Kanäle bzw bytes 0,1,2,3,4,7 ausgewertet:
  kanal 0 wird analog mit h0 und PIN 11 verknüpft 
  kanal 1 wird digital  h1 und PIN 6 verknüpft
  kanal 2 wird digital mit h2 und PIN 7 verknüpft
  kanal 3 wird digital mit h3 und PIN 8 verknüpft
  kanal 4 wird digital mit h4 und PIN 9 verknüpft
  kanal 7 wird digital mit dmxRequest verknüpft
  
  weiterhin werden wenn der kanal7 ungleich 0 ist die gleichen Daten in
  ein anderes Array(sendBuffer) übertragen und über die 
  serielle schnittstelle zurückgesendet. (echo für das überprüfen der empfangenen Daten)
  
Autor:  Reinhard Nickel, FWS_HBO, Bremen Mai 2013
*/


const int DMXADRESS=0; //  Adresse des DMX-Device = 0;
char recBuffer[64], sendBuffer[64];
char h0=0; //analog Lampe
boolean h1=false,h2=false,h3=false,h4=false,h13=false;//digital Lampen
int dmxRequest=0;  // Rückgabewertanforderung
boolean isEchoRequest=false; //flag für echoanforderung

void setup(){
  Serial.begin(9600);
  pinMode(6,OUTPUT);
  pinMode(7,OUTPUT);
  pinMode(8,OUTPUT);
  pinMode(9,OUTPUT);
  pinMode(11,OUTPUT);
}

void loop(){
  readDMXFrame() ;   // einlesen des empfangenen DMX_Frame
  h0=recBuffer[DMXADRESS+0]; // zuweisen des Frameeinzelwertes an analogvariable
  h1=boolean(recBuffer[DMXADRESS+1]);// zuweisen der Frameeinzelwerte an digitalvariablen
  h2=boolean(recBuffer[DMXADRESS+2]);  
  h3=boolean(recBuffer[DMXADRESS+3]); 
  h4=boolean(recBuffer[DMXADRESS+4]); 
  dmxRequest=(recBuffer[DMXADRESS+7]);
  isEchoRequest=dmxRequest > 0;
  if (isEchoRequest){sendEcho(); isEchoRequest=false;}
  analogWrite(11,h0);
  digitalWrite(6,h1); 
  digitalWrite(7,h2); 
  digitalWrite(8,h3); 
  digitalWrite(9,h4); 
  digitalWrite(13,h13); 
 } 

boolean readDMXFrame(){
 if (Serial.available()) {    
   Serial.setTimeout(20);
   Serial.readBytes(recBuffer,32);
 }
}

void sendEcho(){
  for(int i=0; i<32;i++){
  sendBuffer[i]=recBuffer[i];
  Serial.write(recBuffer[i]);
  }
  //Serial.write(sendBuffer);
  delay(25);
}
