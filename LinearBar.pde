class LinearBar{
  float locX;
  float wid;
  int col1;
  int col2;
  float speed;
  PImage loadImage;
  float rotation;
  
  
  LinearBar(){
     loadImage = createImage(700, 700, RGB);
     locX = 100;
     wid = 200;
     col1 = 0;
     col2 = 0;
     speed = 10;
     rotation = 0;
  }
  
  void run(PGraphics g, int tmpWid, int tmpC1, int tmpC2, float tmpSp, float tmpRot){
     
     wid = tmpWid;
     col1 = tmpC1;
     col2 = tmpC2;
     speed = tmpSp;
     rotation = tmpRot;     
     loadImage.loadPixels();
     
     for(int x = 0; x < loadImage.width; x++){
       float dist = abs(x - locX);
       int interpCol = lerpColor(col1, col2, map(dist, 0, wid /2, 1.0, 0));
        for(int y = 0; y < loadImage.height; y++){
           loadImage.pixels[x + y * loadImage.width] = interpCol;
        }
     }
        
     loadImage.updatePixels();
     g.beginDraw();
     g.background(0);
     g.imageMode(CENTER);
     g.translate(g.width/2,g.height/2);
     g.rotate(rotation);
     g.image(loadImage, 0, 0);
     g.endDraw();
     locX += speed;
     println(locX);
  }
  
  void checkEdges(){
    if(locX > loadImage.width){
      locX = 0;
    }
  }
}