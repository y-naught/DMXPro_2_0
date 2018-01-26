void drawGrid(){
    strokeWeight(2);
    stroke(255);
    line(500, 0, 500, 1000);
    line(0, 500, 1000, 500);
    line(0, 750, 500, 750);
}

void drawColorReference(){
    rectMode(CENTER);
    strokeWeight(5);
    if(!colCue){
      if(colSwitch){
        stroke(255);
      }else{
        stroke(0); 
       }
     }
      
      fill(red,green,blue);
      rect(150, 650, 100, 100);
      
      if(!colCue){
      if(!colSwitch){
        stroke(255);
      }else{
        stroke(0); 
        }
      }
      
      fill(red2, green2, blue2);
      rect(350, 650, 100,100);
      
      if(colCue){
        if(colSwitch){
          stroke(255);
        }else if(colSwitch){
          stroke(0); 
         }
       }else{
          stroke(0); 
       }
       
        fill(red3,green3,blue3);
        rect(150, 850, 100, 100);
        
        if(colCue){
          if(!colSwitch){
            stroke(255);
          }else{
            stroke(0); 
          }
          
        }else{
           stroke(0); 
        }
        
        fill(red4, green4, blue4);
        rect(350, 850, 100, 100);
        
        textSize(12);
        textAlign(CENTER);
        fill(127);
        text("Color 1", 150, 650);
        text("Color 2", 350, 650);
        text("Color 3", 150, 850);
        text("Color 4", 350, 850);
        
        textSize(15);
        fill(127);
        text("Current:", 50, 650);
        text("Cued:", 50, 850);
        
        
}
    
void drawControllerReference(){
   strokeWeight(3);
   stroke(255);
   noFill();
   rectMode(CORNER);
   rect(550, 550, 400, 175);
   int y1 = 550;
   int y2 = 725;
   
   for(int i = 0; i < 9; i++){
       int x = 550 + (((950 - 550) / 9) * i);
       line(x, y1, x, y2);
   }
   
   for(int i = 0; i < midiValues.length; i++){
      int tmpX1  = 550 +  (((950 - 550) / 9) * i);
      int tmpX2 = 550 + (((950 - 550) / 9) * (i+1));
      int tmpY = int(map(midiValues[i], 0, 127, 725, 550));
      
      line(tmpX1, tmpY, tmpX2, tmpY);
   }
   
   rectMode(CENTER);
   if(dimControl){
      fill(255); 
   }else{
      fill(0); 
   }
   textSize(15);
   text("Dimmer:", 150, 950);
   rect(250, 950, 30, 30);
}