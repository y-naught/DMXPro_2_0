class SinGradient{
  color c1 = 0;
  color c2 = 0;
  float ang = 0;
  float increment = PI / 64;
  
  SinGradient(){
  }
  
  void update(PGraphics g, int cTmp1, int cTmp2, float tmpA){
    ang += tmpA;     
     g.beginDraw(); 
     g.loadPixels();
     for(int i = 0; i < g.width; i++){
       for(int j = 0; j < g.height; j++){
         color c = lerpColor(c1, c2, map(i, 0, g.width, 0, 1.0));
         g.pixels[i + j * g.width] = c;
       }
     }
     
     float cycle = sin(ang);
     float antiCycle = cos(ang);
     ang += increment;
     
     float newR = map(cycle, -1, 1, 0, red(cTmp1));
     float newG = map(cycle, -1, 1, 0, green(cTmp1));
     float newB = map(cycle, -1, 1, 0, blue(cTmp1));
     
     float newR2 = map(antiCycle, -1, 1, 0, red(cTmp2));
     float newG2 = map(antiCycle, -1, 1, 0, green(cTmp2));
     float newB2 = map(antiCycle, -1, 1, 0, blue(cTmp2));
     
     c1 = color(newR, newG, newB);
     c2 = color(newR2, newG2, newB2);
     
     
     g.updatePixels();
     g.endDraw();  
  }
}