import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.*; 
import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SimpleDmxGui20 extends PApplet {



Serial myPort;
int[] channel=new int[512];
int[] inChannel=new int[512];
int j;
int myColor = color(0,0,0);
final int sliderValue = 100;
final int sliderTicks1 = 100;
final int sliderTicks2 = 30;
Slider abc;

public void setup() {
  size(1100,1000);
  noStroke();
  createPanel(2); 
}

public void draw(){
  background(0xff555555);
}
//void serialports(String item){myPort =  Serial(this, item, 9600);}

public void Send(int theValue) {
  String s="@ ";
  for(int i=0; i<64;i++){
      myPort.write(channel[i]);
      s = s+channel[i] + " ";
    }    
   SendText.setText(s);
   print (s);
}
public void Print(){
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

ControlP5 cp5;
Textarea ReceiveText, SendText;
DropdownList PortList;
public void createPanel(int maxReihen){
 final  int REIHENABSTAND=60,REIHENRANDABSTAND=40,ZEILENRANDABSTAND=100, ZEILENABSTAND=150;
   int gruppenabstand=0;
   cp5 = new ControlP5(this);
   PortList = cp5.addDropdownList("Serialports")
          .setId(100)
          .setPosition(600, 20)
          .setSize(70,50)
          ;
  String portname="";        
 int id=0;
  for (String s : Serial.list()) {
    id++;
    portname=s;
    System.out.println(portname);
    PortList.addItem(portname,id);
  } 
  myPort = new Serial(this, portname, 9600);
   for (int j=0;j<maxReihen;j++ ){
    for(int i=0;i<16;i++){
      int n=j*16+i;
      
      if(i>7){ gruppenabstand=50;}else { gruppenabstand=0;}
      cp5.addSlider("Kanal "+n)
      .setPosition(REIHENABSTAND*i+REIHENRANDABSTAND+gruppenabstand,ZEILENABSTAND*j+ZEILENRANDABSTAND)
      .setId(i+j*16)
      .setSize(20 ,120)
      .setRange(0,255)
      .setNumberOfTickMarks(256)
      .setSliderMode(Slider.FLEXIBLE)
      ;
   }
  } 
  cp5.addButton("Send").setId(600).setPosition(10,10);
  cp5.addButton("Print").setId(601).setPosition(10,60);
  SendText = cp5.addTextarea("SendText")
                  .setPosition(100,10)
                  .setSize(200,60)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(0xffaa1155))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;
  ReceiveText = cp5.addTextarea("ReceiveText")
                  .setPosition(350,10)
                  .setSize(200,60)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(0xffff0000))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;     
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "SimpleDmxGui20" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
