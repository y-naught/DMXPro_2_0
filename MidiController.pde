void controllerChange(int channel, int number, int value) {
  if (number == 48) {
    if(dimControl){
      if(modes2.get(0)){
         for(int i = 0; i < DPacks.size(); i++){
            FourChDimmer d = DPacks.get(i);
            for(int j = 0; j < d.location.length; j++){
               d.intensity[j] = value * 2;
            }
         }
      }
      
    }else if(colSwitch && !colCue){
        red = value * 2;
    }else if(!colSwitch && !colCue){
        red2 = value * 2;
    }else if(colSwitch && colCue){
        red3 = value * 2; 
    }else if(!colSwitch && colCue){
        red4 = value * 2; 
    }
    
    midiValues[0] = value;
  }
  if (number == 49) {
    if(dimControl){
      if(modes2.get(0)){
        FourChDimmer d1 = DPacks.get(0);
        d1.intensity[0] = value * 2;
      }else if(modes2.get(1)){
        addRandomFrame = int(map(value, 0, 127, 5, 30));
      }else if(modes2.get(3)){
         globalSpeed = map(value, 0, 127, 0, PI/8); 
      }else if(modes2.get(4)){
         DPackRotation = map(value, 0, 127, 0, PI / 8); 
      }else if(modes2.get(5)){
         DGroup1 = int(map(value, 0 , 127, 0, 255)); 
      }
    }else if(colSwitch && !colCue){
      green = value * 2;
    }else if(!colSwitch && !colCue){
      green2 = value * 2;
    }else if(colSwitch && colCue){
      green3 = value * 2; 
    }else if(!colSwitch && colCue){
      green4 = value * 2; 
    }
    midiValues[1] = value;
  }
  if (number == 50) {
    if(dimControl){
      if(modes2.get(0)){
      FourChDimmer d1 = DPacks.get(0);
      d1.intensity[1] = value * 2;
      }else if(modes2.get(3)){
         globalWidth = int(map(value, 0, 127, 0, 500)); 
      }else if(modes2.get(5)){
         DGroup2 = int(map(value, 0 , 127, 0, 255)); 
      }
    }else if(colSwitch && !colCue){
      blue = value * 2; 
    }else if(!colSwitch && !colCue){
      blue2 = value * 2;
    }else if(colSwitch && colCue){
      blue3 = value * 2; 
    }else if(!colSwitch && colCue){
      blue4 = value * 2; 
    }
    midiValues[2] = value;
  }
  if (number == 51) {
    if(dimControl){
      if(modes2.get(0)){
        FourChDimmer d1 = DPacks.get(0);
        d1.intensity[2] = value * 2;
      }else if(modes2.get(5)){
         DGroup3 = int(map(value, 0 , 127, 0, 255)); 
      }
    }else{
      if(modes.get(1)){
       globalSpeed = map(value, 0, 127, 0, PI/8); 
     }
     if(modes.get(2)){
       globalSpeed = map(value, 0, 127, 0, PI/ 2); 
     }
      if(modes.get(3)){
       globalSpeed = map(value, 0, 127, 0, PI/12); 
     }
     if(modes.get(4)){
       globalSpeed = map(value, 0, 127, -1, 1); 
     }
    if(modes.get(5)){
       globalSpeed = map(value, 0, 127, 0, 15);
      }
    if(modes.get(7)){
       globalSpeed = map(value, 0, 127, 0, 20); 
    }
    if(modes.get(8)){
       globalSpeed = map(value, 0, 127, 0, 30); 
    }
    if(modes.get(9)){
       globalSpeed = map(value, 0, 127, 0, PI/8); 
    }
     
    }
    midiValues[3] = value;
  }
  if (number == 52) {
    if(dimControl){
      if(modes2.get(0)){
        FourChDimmer d1 = DPacks.get(0);
        d1.intensity[3] = value * 2;
      }else if(modes2.get(5)){
         DGroup4 = int(map(value, 0 , 127, 0, 255)); 
      }
    }else{
      if(modes.get(2)){
       globalRotation = map(value, 0, 127, 0, TWO_PI); 
      }
      if(modes.get(3)){
       globalWidth = int(map(value, 0, 127, 0, 700)); 
      }
      if(modes.get(5)){
        globalNumPart = int(map(value, 0, 127, 0, 15));
      }
      if(modes.get(7)){
        globalSize = map(value, 0 ,127, 0, 30); 
      }
      if(modes.get(8)){
        globalWidth = int(map(value, 0, 127, 1, 300)); 
      }
    }
    midiValues[4] = value;
  }
  if (number == 53) {
    if(dimControl){
      if(modes2.get(0)){
        FourChDimmer d1 = DPacks.get(1);
        d1.intensity[1] = value * 2;
      }
    }else{
      if(modes.get(2)){
         globalDensity = map(value, 0, 127, 10, 200); 
      }
    if(modes.get(5)){
       globalSize = map(value, 0, 127, 0, 25);
      }
    if(modes.get(7)){
       globalNumBalls = int(map(value, 0, 127, 0, 50)); 
      }
    if(modes.get(8)){
       globalRotation = map(value, 0 ,127, 0, TWO_PI); 
      }
    }
    midiValues[5] = value;
  }
  if (number == 54) {
    if(dimControl){
      if(modes2.get(0)){
        FourChDimmer d1 = DPacks.get(1);
        d1.intensity[3] = value * 2;
      }
    }
    midiValues[6] = value;
  }
  if (number == 55) {
    if(dimControl){
      if(modes2.get(0)){
        FourChDimmer d1 = DPacks.get(2);
        d1.intensity[0] = value * 2;
      }
    }
    midiValues[7] = value;
  }
  if (number == 56) {
    if(dimControl){
      if(modes2.get(0)){
        FourChDimmer d1 = DPacks.get(2);
        d1.intensity[1] = value * 2;
      }
    }else{
     alpha = value * 2; 
    }
    midiValues[8] = value;
  }
}



///////////////////////////////////////////////////
/////            Button Handler               /////
///////////////////////////////////////////////////


void noteOn(Note note){
  //Switching Between Effects on the LED window 
  
  if(note.pitch() == 56){
    for(int i = 0; i < modes.size(); i++){
    if(i == 0){
      Boolean m = modes.get(i);
      m = true;
      modes.set(i, m);
      bus.sendNoteOn(0, 56, 127);
    }else{
      Boolean m = modes.get(i);
      m = false; 
      modes.set(i, m);
      bus.sendNoteOn(0, 56, 0);
      } 
    }
    if(lastMode != note.pitch()){
      alpha = 0;
    }
  }
  if(note.pitch() == 57){
    for(int i = 0; i < modes.size(); i++){
      if(i == 1){
        Boolean m = modes.get(i);
        m = true;
        modes.set(i, m);
        bus.sendNoteOn(0, 57, 127);
      }else{
        Boolean m = modes.get(i);
        m = false; 
        modes.set(i, m);
        bus.sendNoteOn(0, 57, 0);
      } 
    }
    if(lastMode != note.pitch()){
      alpha = 0;
    }
  }
  if(note.pitch() == 58){
    for(int i = 0; i < modes.size(); i++){
      if(i == 2){
        Boolean m = modes.get(i);
        m = true;
        modes.set(i, m);
        bus.sendNoteOn(0, 58, 127);
      }else{
        Boolean m = modes.get(i);
        m = false; 
        modes.set(i, m);
        bus.sendNoteOn(0, 58, 0);
      } 
    }
    if(lastMode != note.pitch()){
      alpha = 0;
    }
  }
  if(note.pitch() == 59){
    for(int i = 0; i < modes.size(); i++){
      if(i == 3){
        Boolean m = modes.get(i);
        m = true;
        modes.set(i, m);
        bus.sendNoteOn(0, 59, 127);
      }else{
        Boolean m = modes.get(i);
        m = false; 
        modes.set(i, m);
        bus.sendNoteOn(0, 59, 0);
      } 
    }
    if(lastMode != note.pitch()){
      alpha = 0;
    }
  }
  if(note.pitch() == 60){
    for(int i = 0; i < modes.size(); i++){
      if(i == 4){
        Boolean m = modes.get(i);
        m = true;
        modes.set(i, m);
        bus.sendNoteOn(0, 60, 127);
      }else{
        Boolean m = modes.get(i);
        m = false; 
        modes.set(i, m);
        bus.sendNoteOn(0, 60, 0);
      } 
    }
    if(lastMode != note.pitch()){
      alpha = 0;
    }
  }
  
  if(note.pitch() == 61){
    for(int i = 0; i < modes.size(); i++){
      if(i == 5){
        Boolean m = modes.get(i);
        m = true;
        modes.set(i, m);
        bus.sendNoteOn(0, 61, 127);
      }else{
        Boolean m = modes.get(i);
        m = false; 
        modes.set(i, m);
        bus.sendNoteOn(0, 61, 0);
      } 
    }
    if(lastMode != note.pitch()){
      alpha = 0;
    }
  }
  
  if(note.pitch() == 62){
    for(int i = 0; i < modes.size(); i++){
      if(i == 6){
        Boolean m = modes.get(i);
        m = true;
        modes.set(i, m);
        bus.sendNoteOn(0, 62, 127);
      }else{
        Boolean m = modes.get(i);
        m = false; 
        modes.set(i, m);
        bus.sendNoteOn(0, 62, 0);
      } 
    }
    if(lastMode != note.pitch()){
      alpha = 0;
    }
  }
  if(note.pitch() == 63){
    for(int i = 0; i < modes.size(); i++){
      if(i == 7){
        Boolean m = modes.get(i);
        m = true;
        modes.set(i, m);
        bus.sendNoteOn(0, 63, 127);
      }else{
        Boolean m = modes.get(i);
        m = false; 
        modes.set(i, m);
        bus.sendNoteOn(0, 63, 0);
      } 
    }
    if(lastMode != note.pitch()){
      alpha = 0;
    }
  }
  
  if(note.pitch() == 48){
    for(int i = 0; i < modes.size(); i++){
      if(i == 8){
        Boolean m = modes.get(i);
        m = true;
        modes.set(i, m);
        bus.sendNoteOn(0, 48, 127);
      }else{
        Boolean m = modes.get(i);
        m = false; 
        modes.set(i, m);
        bus.sendNoteOn(0, 48, 0);
      } 
    }
    if(lastMode != note.pitch()){
      alpha = 0;
    }
  }
  
  if(note.pitch() == 49){
    for(int i = 0; i < modes.size(); i++){
      if(i == 9){
        Boolean m = modes.get(i);
        m = true;
        modes.set(i, m);
        bus.sendNoteOn(0, 49, 127);
      }else{
        Boolean m = modes.get(i);
        m = false; 
        modes.set(i, m);
        bus.sendNoteOn(0, 49, 0);
      } 
    }
    if(lastMode != note.pitch()){
      alpha = 0;
    }
  }
  
  //Switching between effects on the Dimmer Pack Window
  
  if(note.pitch() == 40){
     for(int i = 0; i < modes2.size(); i++){
        if(i == 0){
          Boolean m = modes2.get(i);
          m = true;
          modes2.set(i, m);
          bus.sendNoteOn(0, 40, 127);
        }else{
          Boolean m = modes2.get(i);
          m = false; 
          modes2.set(i, m);
          bus.sendNoteOn(0, 40, 0);
        }
     }
     window = false;
  }
  if(note.pitch() == 41){
     for(int i = 0; i < modes2.size(); i++){
        if(i == 1){
          Boolean m = modes2.get(i);
          m = true;
          modes2.set(i, m);
          bus.sendNoteOn(0, 41, 127);
        }else{
          Boolean m = modes2.get(i);
          m = false; 
          modes2.set(i, m);
          bus.sendNoteOn(0, 41, 0);
        }
     }
     window = false;
  }
  if(note.pitch() == 42){
     for(int i = 0; i < modes2.size(); i++){
        if(i == 2){
          Boolean m = modes2.get(i);
          m = true;
          modes2.set(i, m);
          bus.sendNoteOn(0, 42, 127);
        }else{
          Boolean m = modes2.get(i);
          m = false; 
          modes2.set(i, m);
          bus.sendNoteOn(0, 42, 0);
        }
     }
     window = false;
  }
  if(note.pitch() == 43){
     for(int i = 0; i < modes2.size(); i++){
        if(i == 3){
          Boolean m = modes2.get(i);
          m = true;
          modes2.set(i, m);
          bus.sendNoteOn(0, 43, 127);
        }else{
          Boolean m = modes2.get(i);
          m = false; 
          modes2.set(i, m);
          bus.sendNoteOn(0, 43, 0);
        }
     }
     window = true;
  }
  if(note.pitch() == 44){
     for(int i = 0; i < modes2.size(); i++){
        if(i == 4){
          Boolean m = modes2.get(i);
          m = true;
          modes2.set(i, m);
          bus.sendNoteOn(0, 44, 127);
        }else{
          Boolean m = modes2.get(i);
          m = false; 
          modes2.set(i, m);
          bus.sendNoteOn(0, 44, 0);
        }
     }
     window = false;
  }
  
  if(note.pitch() == 45){
     for(int i = 0; i < modes2.size(); i++){
        if(i == 5){
          Boolean m = modes2.get(i);
          m = true;
          modes2.set(i, m);
          bus.sendNoteOn(0, 45, 127);
        }else{
          Boolean m = modes2.get(i);
          m = false; 
          modes2.set(i, m);
          bus.sendNoteOn(0, 45, 0);
        }
     }
     window = false;
  }
  
  if(note.pitch() == 64){
     globalRotation = 3 * PI / 2; 
  }
  
  if(note.pitch() == 65){
     globalRotation = PI / 2; 
  }
  
  if(note.pitch() == 66){
     globalRotation = PI; 
  }
  
  if(note.pitch() == 67){
    globalRotation = 0;
     colPop.switchColor(); 
  }
  
  if(note.pitch() == 86){
     if(mode <= 2){
       mode++;
     }
     if(mode > 2){mode=0;}
  }
  
  if(note.pitch() == 8){
     loadEffectsFile(0);
     alpha = 0;
  }
  if(note.pitch() == 9){
     loadEffectsFile(1);
     alpha = 0;
  }
  
  if(note.pitch() == 10){
     loadEffectsFile(2);
     alpha = 0;
  }
  if(note.pitch() == 69){
     if(!colCue){
        colCue = true; 
     }else{
        colCue = false; 
     }
  }
  
  if(note.pitch() == 70){
     if(!inColTransition){
       inColTransition = true;
       colFrame = frameCount + colLength;
       lerpCol1 = color(red,green, blue);
       lerpCol2 = color(red2, green2, blue2);
       lerpCol3 = color(red3, green3, blue3);
       lerpCol4 = color(red4, green4, blue4);
     }
  }
  
  if(note.pitch() == 71){
     if(dimControl){
       dimControl = false; 
     }else{
       dimControl = true;
     }
  }
  
  if(note.pitch() == 84){
    saveEffectsFile(numSavedFiles);
  }
  
  if(note.pitch() == 89){
    
    DGroup1 = 0;
    DGroup2 = 0;
    DGroup3 = 0;
    DGroup4 = 0;
    
     for(int i = 0; i < DPacks.size(); i++){
        FourChDimmer d = DPacks.get(i);
        for(int j = 0; j < d.intensity.length; j++){
            d.intensity[j] = 0;
        }
     }
     window = false;
  }
  
  if(note.pitch() == 98){
    if(!colSwitch){
       colSwitch = true; 
    }else{
       colSwitch = false;
    }
  }
}