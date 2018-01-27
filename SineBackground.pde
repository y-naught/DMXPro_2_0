class SineBackground{
   int col1;
   int col2;
   float angle;
   float angSpeed;
   
  SineBackground(){
     col1 = 0;
     col2 = 0;
     angle = 0;
     angSpeed = 128 / PI;
  }
  
  void run(PGraphics g, float tmpSp, int tmpC1, int tmpC2){
      col1 = tmpC1;
      col2 = tmpC2;
      angSpeed = tmpSp;
      
      int lerpCol = lerpColor(col1, col2, map(sin(angle), -1, 1, 0, 1.0));
      
      angle += angSpeed;
      g.beginDraw();
      g.background(lerpCol);
      g.endDraw();
  }
  
}