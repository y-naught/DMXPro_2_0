class LinearGradient{
  
  color c1 = color(255, 0, 0);
  color c2 = color(0, 0, 255);
  
  LinearGradient(){     
  }
  
  void update(PGraphics g){
    g.beginDraw();
    g.background(0);
    g.loadPixels();
    for(int i = 0; i < width; i++){
      for(int j = 0; j < height; j++){
        g.pixels[i + j * width] = lerpColor(c1,c2, map(sin(i * PI / map(mouseY, 0, height, 5, 500)+frameCount * PI / 4), -1, 1,0,1));
      }
     }
     
    g.updatePixels();
    g.endDraw();
    
    c1 = color(map(sin(frameCount * PI / map(mouseX, 0, width, 10, 100)), -1,1, 0, 255),0,0);
    c2 = color(0,0,map(cos(frameCount * PI / map(mouseX, 0, width, 10, 100)), -1,1, 0, 255));
  }
  
  
}