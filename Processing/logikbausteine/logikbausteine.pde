
import controlP5.*;
Message Msg1=new Message();
ControlP5 cp5;
Textlabel L1,L2,L3,L4;
Textfield TF1,TF2,TF3,TF4,TF5,TF6;
Textarea TA1,TA2,TA3,Status;
Toggle S0,S1,S2,S3,S4,S7,S8,S5,S6,H0,H1,H2,H3,H4,H5,H6,H7,H8; 
Slider Val0,Val1, Val2,Val3, Val4, Val5, Val6,Val7,Val8;
Button B0,B1,B2,B3,B4,B5,B6,B7,B8;
boolean s1,s2,s3,s4,s5,s6,s7,s8,h0,h1,h2,h3,h4,h5,h6,h7,h8;
String Statustext;
SR SR1=new SR();
GComp GC1=new GComp();


void setup() {
  size(800,600);
  noStroke();  
  cp5 = new ControlP5(this);
  Status = cp5.addTextarea("Status")
                    .setText("A single ControlP5 textlabel, in yellow.xxxxxxxxxxxxxxx")
                    .setPosition(20,200)
                    .setSize(400,100)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("Georgia",12))
                    ;
  L1=cp5.addTextlabel ("xxx").setPosition(100,100)  ;               
  S0=cp5.addToggle("s0").setId(0);  
  S1=cp5.addToggle("s1").setId(1);
  S2=cp5.addToggle("s2").setId(2);
  S3=cp5.addToggle("s3").setId(3);
  S4=cp5.addToggle("s4").setId(4);
  S5=cp5.addToggle("s5").setId(5);
  S6=cp5.addToggle("s6").setId(6);
  S7=cp5.addToggle("s7").setId(7).linebreak();
  
  H0=cp5.addToggle("h0").setId(10).lock();  
  H1=cp5.addToggle("h1").setId(11).lock();
  H2=cp5.addToggle("h2").setId(12).lock();
  H3=cp5.addToggle("h3").setId(13).lock();
  H4=cp5.addToggle("h4").setId(14);
  H5=cp5.addToggle("h5").setId(15);
  H6=cp5.addToggle("h6").setId(16);
  H7=cp5.addToggle("h7").setId(17).linebreak();
  
  Val0=cp5.addSlider("Val0").setRange(0,255)
  .setNumberOfTickMarks(256);
  Val1=cp5.addSlider("Val1").setRange(0,255);
  Val2=cp5.addSlider("Val2").setRange(0,255);
  Val3=cp5.addSlider("Val3").setRange(0,25).linebreak();
  Val4=cp5.addSlider("Val4").setRange(0,255);
  Val5=cp5.addSlider("Val5").setRange(0,255);
  Val6=cp5.addSlider("Val6").setRange(0,255);
  Val7=cp5.addSlider("Val7").setRange(0,255).linebreak();
  
  B0=cp5.addButton("B0").setId(20);
  B1=cp5.addButton("B1").setId(21);
  B2=cp5.addButton("B2").setId(22);
  B3=cp5.addButton("B3").setId(23);
  B4=cp5.addButton("B4").setId(24);
  B5=cp5.addButton("B5").setId(25);
  B6=cp5.addButton("B6").setId(26);
  B7=cp5.addButton("B7").setId(27);
  
  
    TA1 = cp5.addTextarea("txt1")
                  .setPosition(20,250)
                  .setSize(200,200)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(0))
                  .setColorBackground(color(#aaaaaa))
                  .setColorForeground(color(#000000))
                  .setText("leer");
                  
    TA2 = cp5.addTextarea("txt2")
                  .setPosition(240,250)
                  .setSize(200,200)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(0))
                  .setColorBackground(color(#aaaaaa))
                  .setColorForeground(color(#000000))
                  .setText("leer");
                    
}

void draw() {
  background(#aa6666);
  awl();
  setStatus();
  setH();
}
void awl(){
  h1=s1&&s2;
  h2=SR1.set(s3,s4);
  h3=GC1.set(int(Val1.getValue()),int(Val2.getValue()));
}
void setStatus(){
 Statustext=" h1="+h1+" h2="+h2+" h3="+h3+" h4= ";
  Status.setText(Statustext); 
  
}
void setH(){
  H0.setState(h0);
  H1.setState(h1);
  H2.setState(h2);
  H3.setState(h3);
  H4.setState(h4);
  H5.setState(h5);
  H6.setState(h6);
  H7.setState(h7);
 
}

void sliderToMsg(){
  byte[] buf=new byte[8];
  buf[0]=byte(Val0.getValue());
  buf[1]=byte(Val1.getValue());
  buf[2]=byte(Val2.getValue());
  buf[3]=byte(Val3.getValue());
  buf[4]=byte(Val4.getValue());
  buf[5]=byte(Val5.getValue());
  buf[6]=byte(Val6.getValue());
  buf[7]=byte(Val7.getValue());
  // Msg1.setChannels(buf );
  }

public void B1(int _val){
println ("b1");
sliderToMsg();  
TA1.setText (Msg1.getMessageString());
}

public void controlEvent(ControlEvent theEvent) {
  switch(theEvent.getId()) {
      case(1): // numberboxA is registered with id 1
        s1=S1.getState();
        print(Msg1.getMessageString());
         break;
       case(2):  // numberboxB is registered with id 2
        s2=S2.getState();
         break;
       case(3):  // numberboxB is registered with id 2
        s3=S3.getState();
          break;
       case(4):  // numberboxB is registered with id 2
         s4=S4.getState();
          break;
       case(5):  // numberboxB is registered with id 2
         s5=S5.getState();
          break;
       case(6):  // numberboxB is registered with id 2
          s6=S6.getState();
          break;
       case(7):  // numberboxB is registered with id 2
           s7=S7.getState();
          break;
       case(8):  // numberboxB is registered with id 2
            s8=S8.getState();
          break;
 // 
}
}
