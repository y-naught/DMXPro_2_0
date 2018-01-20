void controllerChange(int channel, int number, int value) {
  if (number == 48) {
    dIntensity = value * 2;
  }
  if (number == 49) {
    FourChDimmer d1 = DPacks.get(0);
    d1.intensity[0] = value * 2;
  }
  if (number == 50) {
    FourChDimmer d1 = DPacks.get(0);
    d1.intensity[1] = value * 2;
  }
  if (number == 51) {
    FourChDimmer d1 = DPacks.get(0);
    d1.intensity[2] = value * 2;
  }
  if (number == 52) {
    FourChDimmer d1 = DPacks.get(0);
    d1.intensity[3] = value * 2;
  }
  if (number == 53) {
    FourChDimmer d1 = DPacks.get(1);
    d1.intensity[1] = value * 2;
  }
  if (number == 54) {
    FourChDimmer d1 = DPacks.get(1);
    d1.intensity[3] = value * 2;
  }
  if (number == 55) {
    FourChDimmer d1 = DPacks.get(2);
    d1.intensity[0] = value * 2;
  }
  if (number == 56) {
    FourChDimmer d1 = DPacks.get(2);
    d1.intensity[1] = value * 2;
  }
  
}

void noteOn(Note note){
 
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
}