import processing.serial.*;
import dmxP512.*;
import themidibus.*;


MidiBus bus;
 
DmxP512 dmxOutput;
int universeSize = 256;
String DMXPRO_PORT = "COM4";
int DMXPRO_BAUDRATE = 115000;

int numDPacks = 1;
ArrayList<FourChDimmer> DPacks;
int numColorRails = 1;
ArrayList<ColorRail> colorRails;
int numThCh = 4;
ArrayList<ThreeCh> thCh;

int dIntensity = 0;
float angle = 0;
PrintWriter lightPositions;
PrintWriter effectOutput;

int numEffects = 3;
ArrayList<PGraphics> Layers;
ArrayList<Boolean> modes;

//stores the current channel for when creating the lights during Setup()
int channel = 1;
PVector nextLocation;

SinGradient sinGrad;
LinearGradient linGrad;

void setup() {
  size(500, 500, P2D);
  rectMode(CENTER);

  bus = new MidiBus(this, "APC MINI", "APC MINI");

  dmxOutput = new DmxP512(this, universeSize, false);
  dmxOutput.setupDmxPro(DMXPRO_PORT, DMXPRO_BAUDRATE);

  nextLocation = new PVector(50, 50);

  DPacks = new ArrayList<FourChDimmer>();

  for (int i = 0; i < numDPacks; i++) {

    PVector[] temp = new PVector[4];

    for (int j = 0; j < 4; j++) {
      temp[j] = placeLight(nextLocation);
      nextLocation = temp[j].copy();
    }
    DPacks.add(new FourChDimmer(channel, temp));
    channel += 4;
    println(channel);
  }
  
  
  
  colorRails = new ArrayList<ColorRail>();
  for(int i = 0; i < numColorRails; i++){
    colorRails.add(new ColorRail(channel, placeLight(nextLocation)));
    channel += 26;  
    nextLocation = placeLight(nextLocation);
  }
  
  thCh = new ArrayList<ThreeCh>();
  for(int i = 0; i < numThCh; i++){
    thCh.add(new ThreeCh(channel, placeLight(nextLocation)));
    channel += 3;
    nextLocation = placeLight(nextLocation);
  }
  
  

  ////////////////////////////////////////////////////////////
  /*            Modes and Layers Initialization             */
  ////////////////////////////////////////////////////////////


  modes = new ArrayList<Boolean>(numEffects);
  for (int i = 0; i < numEffects; i++) {
    modes.add(false);
  }

  for (int i = 0; i < modes.size(); i++) {
    if (i == 0) {
      modes.set(i, true);
    } else {
      modes.set(i, false);
    }
  }

  Layers = new ArrayList<PGraphics>();
  for (int i = 0; i < numEffects; i++) {
    Layers.add(createGraphics(width, height));
  }
  
  sinGrad = new SinGradient();
  linGrad = new LinearGradient();
}

void draw() {
  background(0);
  if (modes.get(0)) {
    PGraphics g = Layers.get(0);
    float temp = map(sin(angle), -1, 1, 0, 255);
    angle += PI / map(mouseX, 0, width, 100, 10);
    g.beginDraw();
    //g.background(temp);
    g.background(dIntensity);
    g.endDraw();
  }
  
  if(modes.get(1)){
   PGraphics g = Layers.get(1);
   sinGrad.update(g);
  }
  
  if(modes.get(2)){
   PGraphics g = Layers.get(2);
   linGrad.update(g);
  }
  
  for (int i = 0; i < modes.size(); i++) {
    if (modes.get(i)) {
      PGraphics tmp = Layers.get(i);
      image(tmp, 0, 0);
    }
  }
  drawLights();
  runLights();
}

void controllerChange(int channel, int number, int value) {
  if (number == 48) {
    dIntensity = value * 2;
  }
}

void noteOn(Note note){
 
  if(note.pitch() == 55){
    for(int i = 0; i < modes.size(); i++){
    if(i == 0){
      Boolean m = modes.get(i);
      m = true;
      modes.set(i, m);
      bus.sendNoteOn(0, 55, 127);
    }else{
      Boolean m = modes.get(i);
      m = false; 
      modes.set(i, m);
      bus.sendNoteOn(0, 55, 0);
      } 
    }
  }
  if(note.pitch() == 56){
    for(int i = 0; i < modes.size(); i++){
      if(i == 1){
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
      if(i == 2){
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
}

void runLights() {
  for (int j = 0; j < modes.size(); j++) {
    if (modes.get(j)) {
      PGraphics g = Layers.get(j);

      for (int i = 0; i < DPacks.size(); i++) {
        FourChDimmer d = DPacks.get(i);
        for (int k = 0; k < d.channel.length; k++) {
          dmxOutput.set(d.channel[k], d.sampleColor(g, k));
        }
      }
      
      
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
      
      
      for(int i = 0; i < thCh.size(); i++){
        
        ThreeCh tc = thCh.get(i);
        int tmp = tc.sampleColor(g);
        
        dmxOutput.set(tc.channel[0], tmp >> 16 & 0xFF);
        dmxOutput.set(tc.channel[1], tmp  >> 8 & 0xFF);
        dmxOutput.set(tc.channel[2], tmp & 0xFF);
      }
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
}

PVector placeLight(PVector l) {
  PVector tmp = l.copy();
  if (tmp.x > width) {
    tmp.x = 50;
    tmp.y += 40;
  } else {
    tmp.x += 60;
  }
  return tmp;
 }