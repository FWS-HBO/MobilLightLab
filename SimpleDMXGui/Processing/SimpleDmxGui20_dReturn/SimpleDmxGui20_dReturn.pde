/* MobilLightLab Autoren:
Joshua
Lukas
Jakob
Julie



*/

import processing.serial.*;
import controlP5.*;
Serial myPort;
int[] sendBuffer=new int[512];    // als int wegen vorzeichenproblem ....
byte[] recBuffer=new byte[512];
int j;

boolean isPort=false, isAutoRepeat=false ; //flags für ports angeschlossen und automatisches senden

void setup() {
  size(1100,1000);
  noStroke();
  createPanel(2); //  aufruf der panel erstellung mit 2*16 slider
  if (Serial.list().length==0){    //überprüfen ob usb port angeschlossen ist
    isPort=false;
    SendText.setText("no port connected");    
  }
    else{
      isPort=true;
      println (Serial.list()); //ausgabe der verfügbaren ports im monitor
      String portName = Serial.list()[0];
      myPort = new Serial(this, portName, 9600);   //erstellung der virtuellen schnittstelle
    }
}

void draw(){
  background(#555555);
  receiveResponse();   //überprüfen ob daten anliegen und gegebenfalls in den empfangsbuffer schreiben
 if(isAutoRepeat){sendDMXFrame();} // wenn autoRepeat aktiv ist den frame endlos wiedersenden
}

void Send(int theValue) {       // cp5 eventroutine
  // an die COM senden          wenn send-button gedrückt frame/sendbuffer einmal senden
  sendDMXFrame();
  
}

void AutoRepeat(boolean theValue){  // wenn autorepead toggle betätigt zustand in flag speichern
  isAutoRepeat=theValue;
  println("isAutoRepeat: "+ isAutoRepeat);
}

void sendDMXFrame(){     // sendbuffer inhalte an serielle schnittstelle senden
 for(int i=0; i<32; i++){    
   myPort.write(sendBuffer[i]);
 }  
 display(1);
 delay(25);    // kurze pause um an den empfängern ein frameende/reset auszulösen(länger als timeout !))
}


void Print(){ //cp5 eventroutine
// println ("sendBuffer:");
// 
}
void display(int k){
  if (k==1){
  String s="send: " + "\n";
     for(int i=0; i<31;i++){
       print(sendBuffer[i]+" ");
       s += str(sendBuffer[i])+", ";
     }   
       SendText.setText(s);       
  }
}

void receiveResponse(){  //überprüfung ob eine anforderungsrückmeldung anliegt und diese in den empfangsbuffer schreiben
  String s="receive: \n"; 
  if (isPort){
      while (myPort.available() > 0) {
      delay(10);
      recBuffer = myPort.readBytes();
      myPort.readBytes(recBuffer);
     // print ("receive: ");
      for(int i=0; i<recBuffer.length; i++){    //empfangsstring basteln
       //print (recBuffer[i]+",");
        s+=int(recBuffer[i])+",";  // als int casten weil es sonst vorzeichenprobleme gibt    
      }
       //print (s);
      ReceiveText.setText(s); //empfangsstring im textfenster anzeigen
     }        
   }
}

public void controlEvent(ControlEvent theEvent) {   // cp5 evntroutine   änderungen an den slidern in den sendebuffer schreiben
  int id=theEvent.getId();
  if (id<32){
  int val=(int)theEvent.getController().getValue();
  sendBuffer[id]=val;
  println("id: "+id+ " val: "+val);     // eventmeldung am monitor ausgeben
  
  }
}

