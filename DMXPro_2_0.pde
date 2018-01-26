

////////////////////////////////////////////////////////////
/*                        SETUP                           */
////////////////////////////////////////////////////////////

void setup() {
  size(1000, 1000);
  rectMode(CENTER);
  frameRate(30);

  bus = new MidiBus(this, "APC MINI", "APC MINI");

  dmxOutput = new DmxP512(this, universeSize, true);
  dmxOutput.setupDmxPro(DMXPRO_PORT, DMXPRO_BAUDRATE);

  nextLocation = new PVector(50, 50);

  DPacks = new ArrayList<FourChDimmer>();
  
  bufferImage = createGraphics(500, 500);

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
  for(int i = 0 ; i < numEffects2; i++){
    Layers2.add(createGraphics(500,500));
  }

  
  
  sinGrad = new SinGradient();
  linGrad = new LinearGradient();
  bar = new RotatingBar();
  noise = new PerlinNoise();
  pShower = new Shower(10, 5);
  colPop = new ColorPop();
  bBalls = new BouncingBalls();
  loadLightLocations();
  
  for(int i = 0; i < numColorRails; i++){
     ColorRail cr = colorRails.get(i);
     LEDPositions[i] = cr.location.copy();
  }
  
  for(int i = 0; i < numThCh; i++){
     ThreeCh tc = thCh.get(i);
     LEDPositions[i + 2] = tc.location.copy();
  }
  
  for(int i = 0; i < midiValues.length; i++){
     midiValues[i] = 0; 
  }
}

////////////////////////////////////////////////////////////
/*                       DRAW                             */
////////////////////////////////////////////////////////////


void draw() {
  
  //Auto fade transitions between effects
  for(int i = 0; i < modes.size(); i++){
    if(modes.get(i)){
       if(i != lastMode){
          tFrame = frameCount + tLength;
          lastMode = i;
          inTransition = true;
       }
    }
  }
  
  //updates the alpha values while in transition between effects
  if(inTransition){
          alpha = int(map(tFrame - frameCount, 0, tLength, 255, 0)); 
       }else{
          //alpha = 255; 
         }
       if(tFrame - frameCount == 0){
           inTransition = false;
         }
         
         
  if(inColTransition){
      colLerpFactor = map(colFrame - frameCount, colLength, 0, 0, 1);
      
      int colTmp1 = lerpColor(lerpCol1, lerpCol3, colLerpFactor);
      int colTmp2 = lerpColor(lerpCol2, lerpCol4, colLerpFactor);
      int colTmp3 = lerpColor(lerpCol3, lerpCol1, colLerpFactor);
      int colTmp4 = lerpColor(lerpCol4, lerpCol2, colLerpFactor);
      
      int rTmp1 = colTmp1 >> 16 & 0xFF;
      int gTmp1 = colTmp1 >> 8 & 0xFF;
      int bTmp1 = colTmp1 & 0xFF;
      int rTmp2 = colTmp2 >> 16 & 0xFF;
      int gTmp2 = colTmp2 >> 8 & 0xFF;
      int bTmp2 = colTmp2 & 0xFF;
      int rTmp3 = colTmp3 >> 16 & 0xFF;
      int gTmp3 = colTmp3 >> 8 & 0xFF;
      int bTmp3 = colTmp3 & 0xFF;
      int rTmp4 = colTmp4 >> 16 & 0xFF;
      int gTmp4 = colTmp4 >> 8 & 0xFF;
      int bTmp4 = colTmp4 & 0xFF;
      
      red = rTmp1;
      green = gTmp1;
      blue = bTmp1;
      red2 = rTmp2;
      green2 = gTmp2;
      blue2 = bTmp2;
      red3 = rTmp3;
      green3 = gTmp3;
      blue3 = bTmp3;
      red4 = rTmp4;
      green4 = gTmp4;
      blue4 = bTmp4;
      
      if(colFrame - frameCount == 0){
          inColTransition = false; 
       }
  }
  
  background(0);
  
  //println(frameRate);
  if (modes.get(0)) {
    PGraphics g = Layers.get(0);
    g.beginDraw();
    g.background(red, green, blue);
    g.endDraw();
  }
  
  else if (modes.get(1)) {
    PGraphics g = Layers.get(1);
    sinGrad.update(g,color(red, green, blue), color(red2, green2, blue2), globalSpeed);
  }

  else if (modes.get(2)) {
    PGraphics g = Layers.get(2);
    linGrad.update(g, globalSpeed, globalRotation, color(red, green, blue), color(red2, green2, blue2), globalDensity);
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
    pShower.run(g, g.width, color(red,green,blue), globalSpeed, globalSize, globalNumPart, color(red2, green2, blue2));
  }
  else if ( modes.get(6)){
    PGraphics g = Layers.get(6);
    colPop.display(g, color(red, green, blue), color(red2, green2, blue2));
  }
  else if ( modes.get(7)){
    PGraphics g = Layers.get(7);
    bBalls.update(g, color(red, green, blue), color(red2, green2, blue2), globalNumBalls);
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
    if(frameCount > nextRandomFrame){
       nextRandomFrame = frameCount + addRandomFrame;
       
    }else if(nextRandomFrame == frameCount){
      boolean triggered = false;
      while(!triggered){
      int tmpRandom = int(random(11));
        if(tmpRandom != 10 && tmpRandom != 11 && tmpRandom != 4 && tmpRandom != 6 && tmpRandom !=12 && tmpRandom != curRandomLight){
          curRandomLight = tmpRandom;
          triggered = true;
        }
      }
    }
    g.beginDraw();
    for(int i = 0; i < DPacks.size(); i++){
      FourChDimmer d = DPacks.get(i);
       for(int j = 0; j < d.location.length ;j++){
           if(j+ i* d.location.length == curRandomLight){
             d.intensity[j] = 255;
            }else{
               d.intensity[j] = 0; 
            }
       }
    g.endDraw();
    }
  }
  if(modes2.get(2)){
    PGraphics g = Layers2.get(2);
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
  
  if(modes2.get(3)){
      PGraphics g = Layers2.get(3);
      g.beginDraw();
      g.background(0);
      g.rectMode(CENTER);
      g.translate(g.width/2, g.height/2);
      g.rotate(globalAngle);
      g.rect(0,0,globalWidth, g.height + 200);
      globalAngle += globalSpeed;
      g.endDraw();
  }
  
  if(modes2.get(4)){
      PGraphics g = Layers2.get(4);
      FourChDimmer d1 = DPacks.get(0);
      FourChDimmer d2 = DPacks.get(2);
      
      float tmpBri = map(sin(DPackAngle), -1, 1, 0, 255);
      float tmpBriOp = map(sin(DPackAngle), 1, -1, 0, 255);
      
      DPackAngle += DPackRotation;
      
      d1.intensity[0] = int(tmpBri);
      d1.intensity[3] = int(tmpBri);
      d2.intensity[0] = int(tmpBriOp);
      d2.intensity[1] = int(tmpBriOp);
  }
  
  if(modes2.get(5)){
      PGraphics g = Layers2.get(5);
      FourChDimmer d1 = DPacks.get(0);
      FourChDimmer d2 = DPacks.get(2);
      FourChDimmer d3 = DPacks.get(1);
      
      DPackAngle += DPackRotation;
      
      d1.intensity[0] = DGroup1;
      d1.intensity[3] = DGroup1;
      d1.intensity[1] = DGroup2;
      d1.intensity[2] = DGroup2;
      d2.intensity[0] = DGroup3;
      d2.intensity[1] = DGroup3;
      d3.intensity[1] = DGroup4;
      d3.intensity[3] = DGroup4;
  }

  for (int i = 0; i < modes.size(); i++) {
    if (modes.get(i)) {
      //PGraphics tmp = Layers.get(i);
      //image(tmp, 0, 0);
      
    }
  }
  
  image(bufferImage, 0, 0);
  if(window){
    for(int i = 0; i < modes2.size(); i++){
      if(modes2.get(i)){
         PGraphics g = Layers2.get(i);
         image(g, 500, 0);
      } 
    }
  }
  
  
  
  
  drawLights();
  runLights();
  drawColorReference();
  drawGrid();
  drawControllerReference();
}