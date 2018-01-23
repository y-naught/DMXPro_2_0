
class LinearGradient{
  
  color c1 = 0;
  color c2 = 0;
  PImage tempImg;
  float ang = 0;
  float angSpeed = PI / 64;
  float imgAngle = 0;
  float density = 1;
  
  LinearGradient(){
    tempImg = createImage(700,700,RGB);
  }
  
  void update(PGraphics g, float tmpSpeed, float tmpRot, int tmpC1, int tmpC2, float density){
    
    c1 = tmpC1;
    c2 = tmpC2;
    
    imgAngle = tmpRot;
    angSpeed = tmpSpeed;
    
    g.beginDraw();
    g.background(0);
    //g.loadPixels();
    tempImg.loadPixels();
    for(int i = 0; i < tempImg.width; i++){
      for(int j = 0; j < tempImg.height; j++){
        tempImg.pixels[i + j * tempImg.width] = lerpColor(c1,c2, map(sin(ang + (i * PI / density)), -1, 1,0,1));
      }
    }
    tempImg.updatePixels();
    
    ang += angSpeed;
    
    g.imageMode(CENTER);
    g.translate(g.width/2, g.height/2);
    g.rotate(imgAngle);
    g.image(tempImg, 0, 0);
    
    //g.updatePixels();
    g.endDraw();
    
  }
  
  
}