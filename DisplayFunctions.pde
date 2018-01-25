void drawGrid(){
    strokeWeight(2);
    stroke(255);
    line(500, 0, 500, 1000);
    line(0, 500, 1000, 500);
    line(0, 750, 500, 750);
}

void drawColorReference(){
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
    