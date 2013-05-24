class Message{
  byte[] channel=new byte[16],outBuff=new byte[16];
  String MessageString="leer";
  boolean sendMessage(){
    return true;
  }
  void setChannels(byte[] _buf){
    channel=_buf;
  }
  void setChannel(int _i,byte _val){
    channel[_i]=_val;
  }
  
  String  getMessageString(){
    String test="asd";
    for(int i=0; i<16;i++){
      //String zahlstring=String.valueOf(buffer[i]);
       MessageString +=String.valueOf(channel[i]);
      print (MessageString);
    
    } 
    return test;
  }
}
