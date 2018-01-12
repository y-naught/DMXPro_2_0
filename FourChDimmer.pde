class FourChDimmer{
 int[] channel;
 PVector[] location;
 float sz = 20;
 int[] intensity;
 
 FourChDimmer(int stCh, PVector[] loc){
    
  channel = new int[4];
  intensity = new int[4];
  location = new PVector[4];
  
  for(int i = stCh; i < stCh + channel.length; i++){
    channel[i-stCh] = i; 
    intensity[i-stCh] = 0;
  location[i-stCh] = loc[i-stCh].copy();
    }
  }
 
 int sampleColor(PGraphics img, int id){
  int col = img.pixels[int(location[id].x) +int(location[id].y) * img.width];
  
  float r = col >> 16 & 0xFF;
  float g = col >> 8 & 0xFF;
  float b = col & 0xFF;
  
  int avg = int((r+g+b) / 3);
  
  return avg;
 }
 
 void display(){
  for(int i = 0; i < channel.length; i++){
    stroke(0);
    fill(255);
    rect(location[i].x, location[i].y, sz, sz);
    fill(0);
    text(channel[i] + " ", location[i].x - sz /5, location[i].y + (sz/4));
  }
 }
 
 void move(float x, float y, int id){
    location[id].x = x;
    location[id].y = y;  
  }
}