ControlP5 cp5;
Textarea ReceiveText, SendText;
DropdownList PortList;
final int sliderValue = 100;
final int sliderTicks1 = 100;
final int sliderTicks2 = 30;

void createPanel(int maxReihen){
  final  int REIHENABSTAND=60,REIHENRANDABSTAND=40,ZEILENRANDABSTAND=200, ZEILENABSTAND=150;
  int gruppenabstand=0;
  cp5 = new ControlP5(this);
  cp5.addButton("Send").setId(600).setPosition(10,10);
  cp5.addToggle("AutoRepeat").setId(601).setPosition(10,40)
    .setSize(50,10)
    .setValue(true)
    .setMode(ControlP5.SWITCH)
     ;
  cp5.addButton("Print").setId(602).setPosition(10,70);
  SendText = cp5.addTextarea("SendText")
                  .setPosition(100,10)
                  .setSize(540,160)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(#ffffff))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;
  ReceiveText = cp5.addTextarea("ReceiveText")
                  .setPosition(650,10)
                  .setSize(540,160)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(#ffffff))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ; 
  PortList = cp5.addDropdownList("Serialports")
          .setId(100)
          .setPosition(10, 110)
          .setSize(70,50)
          ; String portname="";  
          
  int id=0;
  for (String s : Serial.list()) {
    id++;
    portname=s;
    System.out.println(portname);
    PortList.addItem(portname,id);
  } 
 // myPort = new Serial(this, portname, 9600);
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
      
}
