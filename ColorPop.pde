class ColorPop{
 
  int curLight1 = 0;
  int curLight2 = 1;
  
  int col1;
  int col2;
  
  ColorPop(){
    col1 = 0;
    col2 = 0;
  }
  
  void switchColor(){
     int randomTmp = int(random(LEDPositions.length));
     int randomTmp2 = int(random(LEDPositions.length));
     boolean tmpSw = true;
     boolean tmpSw2 = true;
     while(tmpSw && tmpSw2){
        if(randomTmp != curLight1 && randomTmp != curLight2){
           curLight1 = randomTmp;
           tmpSw = false;
        }else{
           randomTmp = int(random(LEDPositions.length)); 
        }
        if(randomTmp2 != curLight1 && randomTmp2 !=curLight2){
           curLight2 = randomTmp2;
           tmpSw2 = false;
        }
     }
  }
  
  void display(PGraphics g, int tmpC1, int tmpC2){
     col1 = tmpC1;
     col2 = tmpC2;
     PVector locTmp = LEDPositions[curLight1].copy();
     PVector locTmp2 = LEDPositions[curLight2].copy();
     g.beginDraw();
     g.background(col1);
     g.fill(col2);
     g.noStroke();
     g.rectMode(CENTER);
     g.rect(locTmp.x, locTmp.y, 60, 20);
     g.rect(locTmp2.x, locTmp2.y, 60, 20);
     g.endDraw();
  }
}