import processing.serial.*;
import controlP5.*;
Serial myPort;
int[] channel=new int[512];
int[] inChannel=new int[512];
int j;
int myColor = color(0,0,0);
final int sliderValue = 100;
final int sliderTicks1 = 100;
final int sliderTicks2 = 30;
Slider abc;

void setup() {
  size(1100,1000);
  noStroke();
  createPanel(2); 
}

void draw(){
  background(#555555);
}
//void serialports(String item){myPort =  Serial(this, item, 9600);}

void Send(int theValue) {
  String s="@ ";
  for(int i=0; i<64;i++){
      myPort.write(channel[i]);
      s = s+channel[i] + " ";
    }    
   SendText.setText(s);
   print (s);
}
void Print(){
 println ("Kanalbuffer:");
 for(int i=0; i<64;i++){
   print(channel[i]+" ");println();
   //System.out.println("i und j direkt: " + i + " " + j);
 }
}

public void controlEvent(ControlEvent theEvent) {
  int id=theEvent.getId();
  if (id<64){
  int val=(int)theEvent.getController().getValue();
  channel[id]=val;
  println("id: "+id+ " val: "+val);
  }
  if(id==12){
  //
}
//if(id==100){
// 
//  myPort =  Serial(this, portname, 9600);
}

