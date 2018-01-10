class ColorRail{
  
  int[] channel;
  PVector location;
  float szx = 80;
  float szy = 20;
  int[] cols;
   
  ColorRail(int stCh, PVector loc){
    
    channel = new int[26];
    cols = new int[8];
    location = loc.copy();
    
    for(int i = 0; i < 26; i++){
      channel[i] = stCh + i; 
    }
    for(int i = 0; i < 8; i++){
      cols[i] = 0; 
    }
    
    
  }
  
  int[] sampleColor(PGraphics img){
      
      for(int i = 0; i < cols.length; i++){
        cols[i] = img.pixels[int(location.x) +int(location.y) * img.width];
        //r[i] = cols[i] >> 16 & 0xFF;
        //g[i] = cols[i] >> 8 & 0xFF;
        //b[i] = cols[i] & 0xFF;
      }
      
      return cols;
    }
  
  void display(){
     stroke(0);
     fill(255);
     rect(location.x, location.y, szx, szy);
     //text(char(channel), location.x, location.y); 
  }
  
}