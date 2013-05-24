import processing.serial.*;
import controlP5.*;
Serial myPort;
int[] sendBuffer=new int[512];
//byte[] recBuffer=new byte[512];
int j;
int myColor = color(0,0,0);
Slider abc;
boolean isPort=false;
void setup() {
  size(1100,1000);
  noStroke();
  createPanel(2); 
  //str names[]=Serial.list();
  if (Serial.list().length==0){
    isPort=false;
    SendText.setText("no port connected");
    
  }
    else{
      isPort=true;
      println (Serial.list()); //ausgabe der verfügbaren ports im monitor
      String portName = Serial.list()[0];
      myPort = new Serial(this, portName, 9600);
  }
  }

void draw(){
  background(#555555);
  // byte[] inBuffer = new byte[7];
//  while (myPort.available() > 0) {
//   // inBuffer = myPort.readBytes();
//   recBuffer = myPort.readBytes();
//    myPort.readBytes(recBuffer);
//    if (recBuffer != null) {
//      String myString = new String(recBuffer);
//      println(myString);
//    }
//}
}

void Send(int theValue) {// cp5 eventroutine
  // an die COM senden
  sendDMXFrame();
  display();
}
void sendDMXFrame(){
 for(int i=0; i<32; i++){    
   myPort.write(sendBuffer[i]);
 }  
  
   delay(30);
}


void display(){
     //ausgabe im textfeld
  String s="Send: ";
  for(int i=0; i<32;i++){
     // myPort.write(sendBuffer[i]);
      s = s+sendBuffer[i] + ",";
    }    
   SendText.setText(s);
   println (s);
}

void Print(){ //cp5 eventroutine
 println ("sendBuffer:");
 String s="";
 for(int i=0; i<31;i++){
   print(sendBuffer[i]+" ");
   s += str(sendBuffer[i])+", ";
   //println();
   //System.out.println("i und j direkt: " + i + " " + j);
 }
 SendText.setText(s);
}
//void serialEvent(Serial p) { 
// 
//   while (p.available ()> 0) {
//    recBuffer[] = myPort.read ();
//    println (InByte);
//  }
//  
//  
//  
//  
//  if (p.available)
//  inString = p.readString(); 
//}





public void controlEvent(ControlEvent theEvent) {
  int id=theEvent.getId();
  if (id<32){
  int val=(int)theEvent.getController().getValue();
  sendBuffer[id]=val;
  println("id: "+id+ " val: "+val);
  }
}

