
String save;  
String [] savelist;  
  
void savescene(){
  
  save = "";
  
  for(int i=0; i<32; i++){
  save += str(saveBuffer[i])+" ";
  }
  savelist=split(save,' ');
  
  saveStrings("save.txt", savelist);
  
  save = "";
  
 text(save,100,100); 
}



  

