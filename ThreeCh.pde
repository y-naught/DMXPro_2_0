class ThreeCh{
   int[] channel;
   color c;
   PVector location;
   float sz = 20;
   
   ThreeCh(int stCh, PVector loc){
       channel = new int[3];
       //stores the channel numbers for RGB
       for(int i = stCh; i < stCh + channel.length; i++){
        channel[i - stCh] =  i;
       }
       //switch this to the static PVector method
       location = loc.copy();
   }
   
   void display(){
     rectMode(CENTER);
      strokeWeight(1);
      stroke(0);
      fill(255);
      rect(location.x, location.y, sz, sz);
      fill(0);
      text(channel[0] + " ", location.x, location.y);
   }
   
   int sampleColor(PGraphics g){
     int tmp = 0;
     //g.loadPixels();
     tmp = g.pixels[int(location.x) +int(location.y) * g.width];
     //g.updatePixels();
     return tmp;
   }
   
   void move(float x, float y){
    location.x = x;
    location.y = y;
  }
}