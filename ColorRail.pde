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
            cols[i] = img.pixels[int(location.x + map(i, 0, cols.length, -30, 30))  +int(location.y) * img.width];
          }
          
          return cols;
      }
    
    void display(){
         rectMode(CENTER);
         strokeWeight(1);
         stroke(0);
         fill(255);
         rect(location.x, location.y, szx, szy);
         fill(0);
         text(channel[0] + " ", location.x, location.y); 
    }
    
    void move(float x, float y){
        location.x = x;
        location.y = y;
    }
  
  
}