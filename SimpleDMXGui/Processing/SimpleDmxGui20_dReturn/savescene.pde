
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
  
 
  
  saveStrings(filename, savelist);
  
  save = "";
  
 println("saved");
}



void Load(){
  
  
  
  println("loaded");
  String slider[] = loadStrings(filename);
  for(int i=0; i<32; i++){
  cp5.getController("Kanal"+i).setValue(int(slider[i]));
  
  }
  
}

void Next(){
  
     sceneselected=scenevalue;
     scenevalue++;
     filename = "save"+sceneselected+".txt";
     Load();
     
}

void Random(){
  
  cp5.getController("Kanal"+0).setValue(int(random(0, 255)));
  cp5.getController("Kanal"+1).setValue(int(random(0,255)));
  cp5.getController("Kanal"+2).setValue(int(random(0,255)));
  
    
  
}






