
String save;  
String [] savelist;  



void Save(){
  
   savescene();
   
}

void savescene(){
  
  save = "";
  
  for(int i=0; i<32; i++){
  save += str(saveBuffer[i])+" ";
  }
  savelist=split(save,' ');
  
  saveStrings("save.txt", savelist);
  
  save = "";
  
 println("saved");
}



void Load(){
  
  
  println("loaded");
  String slider[] = loadStrings("save.txt");
  for(int i=0; i<32; i++){
  cp5.getController("Kanal"+i).setValue(int(slider[i]));
  
  }
  
}

  

