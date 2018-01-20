void runLights() {
  for (int j = 0; j < modes.size(); j++) {
    if (modes.get(j)) {
      PGraphics g = Layers.get(j);
      //g.loadPixels();
      //Dimmer Pack Outputs
      if(onScreen == true){
      for (int i = 0; i < DPacks.size(); i++) {
        FourChDimmer d = DPacks.get(i);
        for (int k = 0; k < d.channel.length; k++) {
          dmxOutput.set(d.channel[k], d.sampleColor(g, k));
        }
      }
         
      }else{
        for(int i = 0; i < DPacks.size(); i++){
           FourChDimmer d = DPacks.get(i);
           for(int k = 0; k < d.intensity.length; k++){
              dmxOutput.set(d.channel[k], d.intensity[k]); 
           }
        }
      }
      
      //Color Rail Output
      for(int i = 0; i < colorRails.size(); i++){
        ColorRail cr = colorRails.get(i);
        
        int[] tmpCols = cr.sampleColor(g);
        int[] cOrdered = new int[24];
        
        for(int l = 0; l < cOrdered.length; l+=3){
          cOrdered[l] = tmpCols[l/3]  >> 16 & 0xFF;
          cOrdered[l+1] = tmpCols[l/3]  >> 8 & 0xFF;
          cOrdered[l+2] = tmpCols[l/3] & 0xFF;
        }
        
        for(int k = 0 ;k < cr.channel.length - 1; k++){
          if(k == 0){
            dmxOutput.set(cr.channel[k], 255);
          }else{
            dmxOutput.set(cr.channel[k], cOrdered[k-1]);
          }
        }
      }
      
      //Three Channel Output
      for(int i = 0; i < thCh.size(); i++){
        
        ThreeCh tc = thCh.get(i);
        int tmp = tc.sampleColor(g);
        
        dmxOutput.set(tc.channel[0], tmp >> 16 & 0xFF);
        dmxOutput.set(tc.channel[1], tmp  >> 8 & 0xFF);
        dmxOutput.set(tc.channel[2], tmp & 0xFF);
      }
      
      //Five Channel Output
      //for(int i = 0; i < fvCh.size(); i++){
        
      //  FiveCh fv = fvCh.get(i);
      //  int tmp = fv.sampleColor(g);
        
        
      //  dmxOutput.set(fv.channel[0], 255);
      //  dmxOutput.set(fv.channel[1], tmp >> 16 & 0xFF);
      //  dmxOutput.set(fv.channel[2], tmp  >> 8 & 0xFF);
      //  dmxOutput.set(fv.channel[3], tmp & 0xFF);
      //  dmxOutput.set(fv.channel[4], 255);
        
      //}
      //g.updatePixels();
    }
  }
}

void drawLights() {
  for (int i = 0; i < DPacks.size(); i++) {
    FourChDimmer d = DPacks.get(i);
    for (int j =0; j < 4; j++) {
      d.display();
    }
  }
  for(int i = 0; i < colorRails.size(); i++){
    ColorRail cr = colorRails.get(i);
    cr.display();
  }
  
  for(int i = 0; i <thCh.size(); i++){
    ThreeCh tc = thCh.get(i);
    tc.display();
  }
  
  //for(int i = 0; i <fvCh.size(); i++){
  //  FiveCh fv = fvCh.get(i);
  //  fv.display();
  //}
}

PVector placeLight(PVector l) {
  PVector tmp = l.copy();
  if (tmp.x > width/2) {
    tmp.x = 50;
    tmp.y += 40;
  } else {
    tmp.x += 60;
  }
  return tmp;
}