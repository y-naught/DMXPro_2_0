
class FiveCh{
   int[] channel;
   color c;
   PVector location;
   float sz = 20;
   
   FiveCh(int stCh, PVector loc){
      channel = new int[5];
      for(int i = stCh; i < stCh + channel.length; i++){
          channel[stCh-i] = i;
        }
      location = loc.copy();
   }
   
   void display(){
        stroke(0);
        fill(255);
        rect(location.x, location.y, sz, sz);
        fill(0);
        text(channel[0] + " ", location.x - (2 * sz / 5), location.y + (sz/4));
   }
   
   void move(float x, float y){
        location.x = x;
        location.y = y;
   }
   
   int sampleColor(PGraphics g){
     int tmp = 0;
     g.loadPixels();
     tmp = g.pixels[int(location.x) +int(location.y) * g.width];
     g.updatePixels();
     return tmp;
   }
}