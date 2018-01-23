
class PerlinNoise{
    
    int noiseMode = 0;
    float incrementX;
    float incrementY;
    float moveX;
    float moveY;
    float offX;
    float curX;
    float offY;
    float curY;
    
  PerlinNoise(){
    incrementX = 0.01;
    incrementY = 0.01;
    moveX = 0.05;
    moveY = 0.05;
    offX = 0.0;
    curX = 0.0;
    offY = 0.0;
    curY = 0.0;
  }
  
  void update(PGraphics g, int r1, int g1, int b1,float mvx, int mdTmp){
    g.beginDraw();
    g.loadPixels();
    noiseMode = mdTmp;
    int tmp = 0;
    for(int x = 0; x < g.width; x++){
       offX += incrementX;
       for( int y = 0; y < g.height; y++){
          offY += incrementY;
          
          if(noiseMode > 2){
             noiseMode = 0; 
          }
          
          if(noiseMode == 0){
             
             int r = int(noise(offX, offY) * r1);
             int gr = int(noise(offX, offY) * g1);
             int b = int(noise(offX, offY) * b1);
             
             tmp = color(r,gr,b);
          }
          
          else if(noiseMode == 1){
             float n = 0;
             n = noise(offX, offY) * 255;

             int r = int(n);
             int gr = int(noise(offX+0.4, offY) * 255);
             int b = int(noise(offX+0.8, offY) * 255);
             tmp = color(r,gr,b);
          }
          
          
          
          g.pixels[x + y * g.width] = tmp;
       }
       
       offY = curY;
    }
    
    g.updatePixels();
    g.endDraw();
    
    curX += 0; //moveX;
    offX = curX;
    curY += mvx;
    //curY += moveY;
    offY = curY;
  }
  
}