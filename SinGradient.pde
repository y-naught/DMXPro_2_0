class SinGradient{
  color c1;
  color c2;
  
  SinGradient(){
     c1 = color(255, 0, 0);
     c2 = color(0, 0, 255);
  }
  
  void update(PGraphics g){
     g.beginDraw();
     
     g.loadPixels();
     for(int i = 0; i < g.width; i++){
     for(int j = 0; j < g.height; j++){
     color c = lerpColor(c1, c2, map(i, 0, g.width, 0, 1.0));
     g.pixels[i + j * g.width] = c;
   }
  }
     g.updatePixels();
     g.endDraw();  
     
     c1 = color(map(sin(frameCount * PI / map(mouseX, 0, g.width, 1, 500)), -1,1, 0, 255),0,0);
     c2 = color(0,0,map(cos(frameCount * PI / map(mouseX, 0, g.width, 1, 500)), -1,1, 0, 255));
  }
}