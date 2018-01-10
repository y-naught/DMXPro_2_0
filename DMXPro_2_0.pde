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

int dIntensity = 0;
float angle = 0;
PrintWriter lightPositions;
PrintWriter effectOutput;

int numEffects = 1;
ArrayList<PGraphics> Layers;
ArrayList<Boolean> modes;

//stores the current channel for when creating the lights during Setup()
int channel = 1;
PVector nextLocation;


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
  }
  
  colorRails = new ArrayList<ColorRail>();
  for(int i = 0; i < numColorRails; i++){
    colorRails.add(new ColorRail(channel, placeLight(nextLocation)));
    channel += 26;  
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
}

void draw() {
  background(0);
  println(frameRate);
  if (modes.get(0)) {
    PGraphics g = Layers.get(0);
    //float temp = map(sin(angle), -1, 1, 0, 255);
    angle += PI / 60;
    //println(temp);
    g.beginDraw();
    g.background(dIntensity);
    g.endDraw();
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
          //dmxOutput.set(cr.channel[k], cOrdered[k-1]);
          //dmxOutput.set(cr.channel[k], cOrdered[k-1]);
          }
        }
        
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
}

PVector placeLight(PVector l) {
  PVector tmp = l.copy();
  if (tmp.x + 40 > width) {
    tmp.x = 50;
    tmp.y += 40;
  } else {
    tmp.x += 60;
  }
  return tmp;
}