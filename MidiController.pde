void controllerChange(int channel, int number, int value) {
  if (number == 48) {
    if(dimControl){
      
    }else if(colSwitch){
        red = value * 2;
    }else{
        red2 = value * 2;
    }
  }
  if (number == 49) {
    if(dimControl){
      FourChDimmer d1 = DPacks.get(0);
      d1.intensity[0] = value * 2;
    }else if(colSwitch){
      green = value * 2;
    }else{
      green2 = value * 2;
    }
  }
  if (number == 50) {
    if(dimControl){
      FourChDimmer d1 = DPacks.get(0);
      d1.intensity[1] = value * 2;
    }else if(colSwitch){
      blue = value * 2; 
    }else{
      blue2 = value * 2;
    }
    
  }
  if (number == 51) {
    if(dimControl){
      FourChDimmer d1 = DPacks.get(0);
      d1.intensity[2] = value * 2;
    }else{
      if(modes.get(3)){
       globalSpeed = map(value, 0, 127, 0, PI/12); 
     }
     if(modes.get(4)){
       globalSpeed = map(value, 0, 127, -1, 1); 
     }
    if(modes.get(5)){
       globalSpeed = map(value, 0, 127, 0, 15);
      }
     
    }
  }
  if (number == 52) {
    if(dimControl){
      FourChDimmer d1 = DPacks.get(0);
      d1.intensity[3] = value * 2;
    }else{
      if(modes.get(3)){
       globalWidth = int(map(value, 0, 127, 0, 700)); 
      }
      if(modes.get(5)){
        globalNumPart = int(map(value, 0, 127, 0, 15));
      }
    }
  }
  if (number == 53) {
    if(dimControl){
      FourChDimmer d1 = DPacks.get(1);
      d1.intensity[1] = value * 2;
    }else{
    if(modes.get(5)){
       globalSize = map(value, 0, 127, 0, 25);
    }
    }
  }
  if (number == 54) {
    if(dimControl){
      FourChDimmer d1 = DPacks.get(1);
      d1.intensity[3] = value * 2;
    }
  }
  if (number == 55) {
    if(dimControl){
      FourChDimmer d1 = DPacks.get(2);
      d1.intensity[0] = value * 2;
    }
  }
  if (number == 56) {
    if(dimControl){
      FourChDimmer d1 = DPacks.get(2);
      d1.intensity[1] = value * 2;
    }
  }
  
}

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
  }
  
  if(note.pitch() == 7){
     if(mode < 2){
       mode++;
     }
     if(mode >=2){mode=0;}
  }
  
  if(note.pitch() == 71){
     if(dimControl){
       dimControl = false; 
     }else{
       dimControl = true;
     }
  }
  if(note.pitch() == 98){
    if(colSwitch){
       colSwitch = false; 
    }else{
       colSwitch = true;
    }
  }
}