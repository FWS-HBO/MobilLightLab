class SR{
  boolean q;
  boolean set(boolean _s,boolean _r){
    if(_s){q=true;}
    if(_r) {q=false;}
    return q;
   }
}

class GComp{
   boolean q;
   boolean set(int _val1,int _val2){
     q=(_val1>_val2);
     return q;
   }
}

class TImpuls{
int t, t1, t2,tStop,interval,x,y,counter;
boolean pfl,nfl, autostart, q;
TImpuls(int _interval,boolean _autostart){
  interval=_interval;
  autostart=_autostart;
}
void start(){
  t1=millis();
  q=true;
  pfl=true;
  //counter++;
}
void stop(){
  q=false;
  tStop=t;
  t=0;
}
void cReset(){
counter=0;
}
void update(){
  pfl=false;
  nfl=false;
  t2=millis();
  if (q){ 
     if (t>0) {pfl=false;}
    t=t2-t1;   
  }
  if (t>=interval){
    t=0;    
    q=false; nfl=true;
    if(autostart){start();}
  }  
  if (nfl){counter++;}
}

void draw(){
 update();
}
}
