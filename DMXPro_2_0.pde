

  ////////////////////////////////////////////////////////////
  /*                        SETUP                           */
  ////////////////////////////////////////////////////////////

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
    nextLocation = placeLight(nextLocation);
  }
  
  thCh = new ArrayList<ThreeCh>();
  for(int i = 0; i < numThCh; i++){
    thCh.add(new ThreeCh(channel, placeLight(nextLocation)));
    channel += 3;
    nextLocation = placeLight(nextLocation);
  }
  
  fvCh = new ArrayList<FiveCh>();
  for(int i = 0; i < numThCh; i++){
    thCh.add(new ThreeCh(channel, placeLight(nextLocation)));
    channel += 5;
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

  ////////////////////////////////////////////////////////////
  /*                       DRAW                             */
  ////////////////////////////////////////////////////////////


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