

void keyPressed(){
    if(key == 'a'){
       for(int i = 0; i < DPacks.size(); i++){
          FourChDimmer d = DPacks.get(i);
          for(int j = 0; j <  d.location.length; j++){
             if(mouseX >= d.location[j].x - d.sz / 2 + 500 && mouseX <= d.location[j].x + d.sz / 2 + 500 && mouseY >= d.location[j].y - d.sz/2 && mouseY <= d.location[j].y + d.sz/2){
               d.location[j].x = mouseX - 500;
               d.location[j].y = mouseY;
             }
          }
       }
       for(int i = 0; i < colorRails.size(); i++){
          ColorRail cr = colorRails.get(i);
          if(mouseX >= cr.location.x - cr.szx / 2 && mouseX <=  cr.location.x + cr.szx / 2 && mouseY >=  cr.location.y - cr.szy / 2 && mouseY <=  cr.location.y + cr.szy / 2){
            cr.location.x = mouseX;
            cr.location.y = mouseY;
          }
       }
       
       for(int i = 0; i < thCh.size(); i++){
          ThreeCh tch = thCh.get(i);
          if(mouseX >= tch.location.x - tch.sz / 2 && mouseX <= tch.location.x + tch.sz / 2 && mouseY >= tch.location.y - tch.sz / 2 && mouseY <= tch.location.y + tch.sz / 2){
            tch.location.x = mouseX;
            tch.location.y = mouseY;
          }
       }
    }
    
    if(key == 's'){
        
    }
}