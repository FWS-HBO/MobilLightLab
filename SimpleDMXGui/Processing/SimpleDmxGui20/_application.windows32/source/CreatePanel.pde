ControlP5 cp5;
Textarea ReceiveText, SendText;
DropdownList PortList;
void createPanel(int maxReihen){
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
                  .setColor(color(#aa1155))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;
  ReceiveText = cp5.addTextarea("ReceiveText")
                  .setPosition(350,10)
                  .setSize(200,60)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(#ff0000))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;     
}
