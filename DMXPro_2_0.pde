

////////////////////////////////////////////////////////////
/*                        SETUP                           */
////////////////////////////////////////////////////////////

void setup() {
  size(1000, 500);
  rectMode(CENTER);
  frameRate(30);

  bus = new MidiBus(this, "APC MINI", "APC MINI");

  dmxOutput = new DmxP512(this, universeSize, true);
  dmxOutput.setupDmxPro(DMXPRO_PORT, DMXPRO_BAUDRATE);

  nextLocation = new PVector(50, 50);

  DPacks = new ArrayList<FourChDimmer>();

  for (int i = 0; i < numDPacks; i++) {
    PVector[] temp = new PVector[4];
    for (int j = 0; j < 4; j++) {
      //nextLocation.x += 500;
      temp[j] = placeLight(nextLocation);
      //nextLocation.x -= 500;
      nextLocation = temp[j].copy();
    }
    DPacks.add(new FourChDimmer(channel, temp));
    channel += 4;
  }

  colorRails = new ArrayList<ColorRail>();
  for (int i = 0; i < numColorRails; i++) {
    colorRails.add(new ColorRail(channel, placeLight(nextLocation)));
    channel += 26;  
    nextLocation = placeLight(nextLocation);
  }

  //fvCh = new ArrayList<FiveCh>();
  //for(int i = 0; i < numThCh; i++){
  //  fvCh.add(new FiveCh(channel, placeLight(nextLocation)));
  //  channel += 5;
  //  nextLocation = placeLight(nextLocation);
  //}

  thCh = new ArrayList<ThreeCh>();
  for (int i = 0; i < numThCh; i++) {
    thCh.add(new ThreeCh(channel, placeLight(nextLocation)));
    channel += 3;
    nextLocation = placeLight(nextLocation);
  }

  println(channel);
  for(int i = 0; i < dimLights.length; i++){
    
  }




  ////////////////////////////////////////////////////////////
  /*            Modes and Layers Initialization             */
  ////////////////////////////////////////////////////////////


  modes = new ArrayList<Boolean>(numEffects);
  for (int i = 0; i < numEffects; i++) {
    modes.add(false);
  }
  modes2 = new ArrayList<Boolean>(numEffects2);
  for (int i = 0; i < numEffects2; i++) {
    modes2.add(false);
  }

  for (int i = 0; i < modes.size(); i++) {
    if (i == 0) {
      modes.set(i, true);
    } else {
      modes.set(i, false);
    }
  }

  Layers = new ArrayList<PGraphics>();
  Layers2 = new ArrayList<PGraphics>();
  for (int i = 0; i < numEffects; i++) {
    Layers.add(createGraphics(500, 500));
  }
  for(int i = 0 ; i< numEffects2; i++){
    Layers2.add(createGraphics(500,500));
  }

  sinGrad = new SinGradient();
  linGrad = new LinearGradient();
  bar = new RotatingBar();
  noise = new PerlinNoise();
  pShower = new Shower(10, 5);
}

////////////////////////////////////////////////////////////
/*                       DRAW                             */
////////////////////////////////////////////////////////////


void draw() {
  background(0);
  
  //println(frameRate);
  if (modes.get(0)) {
    PGraphics g = Layers.get(0);
    float temp = map(sin(angle), -1, 1, 0, 255);
    angle += PI / map(mouseX, 0, width/2, 100, 10);
    g.beginDraw();
    //g.background(temp);
    g.background(red, green, blue);
    g.endDraw();
  }
  
  else if (modes.get(1)) {
    PGraphics g = Layers.get(1);
    sinGrad.update(g);
  }

  else if (modes.get(2)) {
    PGraphics g = Layers.get(2);
    linGrad.update(g);
  }
  
  else if ( modes.get(3)){
    PGraphics g = Layers.get(3);
    //g.loadPixels();
    bar.update(g, color(red, green, blue), color(red2, green2, blue2), globalSpeed, globalWidth);
    //g.updatePixels();
  }
  
  else if ( modes.get(4)){
    PGraphics g = Layers.get(4);
    noise.update(g, red, green, blue, globalSpeed, mode);
  }
  else if (modes.get(5)){
    PGraphics g = Layers.get(5);
    g.beginDraw();
    g.background(0);
    g.endDraw();
    pShower.run(g, g.width, color(red,green,blue), globalSpeed, globalSize, globalNumPart);
  }
  
  if(modes2.get(0)){
    PGraphics g = Layers2.get(0);
    g.beginDraw();
    for(int i = 0; i < DPacks.size(); i++){
      FourChDimmer d = DPacks.get(i);
       for(int j = 0; j < d.location.length ;j++){
         
       }
    }
    g.endDraw();
  }
  
  if(modes2.get(1)){
    PGraphics g = Layers2.get(1);
    g.beginDraw();
    for(int i = 0; i < DPacks.size(); i++){
      FourChDimmer d = DPacks.get(i);
       for(int j = 0; j < d.location.length ;j++){
         
           d.intensity[j] += map(noise(nDif + i * j), 0, 0.5, -1, 1);
           
           nDif+=0.001;
           if(d.intensity[j] < 0){
              d.intensity[j] = 0;
           }
           else if(d.intensity[j] > 255){
              d.intensity[j] = 255;
           }
        }
     }
    g.endDraw();
  }
  
  if(modes2.get(2)){
    PGraphics g = Layers2.get(1);
    g.beginDraw();
    for(int i = 0; i < DPacks.size(); i++){
      FourChDimmer d = DPacks.get(i);
       for(int j = 0; j < d.location.length ; j++){
           d.intensity[j] = int(map(sin(angle + (j + i * j)), -1, 1, 0, 255));
           angle += PI / 512;
        }
     }
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
  strokeWeight(2);
  stroke(255);
  line(500, 0, 500, 500);
}