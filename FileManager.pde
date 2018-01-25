
void saveLightLocations(){
   PrintWriter locs = createWriter("LightLocations2.txt");
   for(int i = 0; i < DPacks.size(); i++){
          FourChDimmer d = DPacks.get(i);
          for(int j = 0; j <  d.location.length; j++){
             locs.println(d.location[j].x);
             locs.println(d.location[j].y);
          }
       }
       for(int i = 0; i < colorRails.size(); i++){
          ColorRail cr = colorRails.get(i);
          locs.println(cr.location.x);
          locs.println(cr.location.y);
       }
       
       for(int i = 0; i < thCh.size(); i++){
          ThreeCh tch = thCh.get(i);
          locs.println(tch.location.x);
          locs.println(tch.location.y);
       }
       locs.flush();
       locs.close();
}

void loadLightLocations(){
      String[] positions = loadStrings("LightLocations.txt");
      int count = 0;
    for(int i = 0; i < DPacks.size(); i++){
          FourChDimmer d = DPacks.get(i);
          for(int j = 0; j <  d.location.length; j++){
             d.location[j].x = float(positions[count]);
             d.location[j].y = float(positions[count + 1]);
             count +=2;
          }
       }
       for(int i = 0; i < colorRails.size(); i++){
          ColorRail cr = colorRails.get(i);
          cr.location.x = float(positions[count]);
          cr.location.y = float(positions[count + 1]);
          count +=2;
       }
       
       for(int i = 0; i < thCh.size(); i++){
          ThreeCh tch = thCh.get(i);
          tch.location.x = float(positions[count]);
          tch.location.y = float(positions[count + 1]);
          count += 2;
       }
}

void saveEffectsFile(int numF){
    PrintWriter effectsOut = createWriter("EffectsFile" + numF + ".txt");
    effectsOut.println(red);
    effectsOut.println(red2);
    effectsOut.println(red3);
    effectsOut.println(red4);
    effectsOut.println(green);
    effectsOut.println(green2);
    effectsOut.println(green3);
    effectsOut.println(green4);
    effectsOut.println(blue);
    effectsOut.println(blue2);
    effectsOut.println(blue3);
    effectsOut.println(blue4);
    effectsOut.println(globalSpeed);
    effectsOut.println(globalSize);
    effectsOut.println(globalNumPart);
    effectsOut.println(globalWidth);
    effectsOut.println(mode);
    effectsOut.println(globalRotation);
    effectsOut.println(globalDensity);
    effectsOut.println(globalAngle);
    effectsOut.println(tLength);
    effectsOut.println(colLength);
    for(int i = 0; i < modes.size(); i++){
       if(modes.get(i)){
          effectsOut.println(i); 
       }
    }
    effectsOut.flush();
    effectsOut.close();
    numSavedFiles++;
}

void loadEffectsFile(int numF){
    String[] variables = loadStrings("EffectsFile" + numF + ".txt");
    red = int(variables[0]);
    red2 = int(variables[1]);
    red3 = int(variables[2]);
    red4 = int(variables[3]);
    green = int(variables[4]);
    green2 = int(variables[5]);
    green3 = int(variables[6]);
    green4 = int(variables[7]);
    blue = int(variables[8]);
    blue2 = int(variables[9]);
    blue3 = int(variables[10]);
    blue4 = int(variables[11]);
    globalSpeed = float(variables[12]);
    globalSize = float(variables[13]);
    globalNumPart = int(variables[14]);
    globalWidth = int(variables[15]);
    mode = int(variables[16]);
    globalRotation = float(variables[17]);
    globalDensity = float(variables[18]);
    globalAngle = float(variables[19]);
    tLength = int(variables[20]);
    colLength = int(variables[21]);
    for(int i = 0; i < modes.size(); i++){
        if(i == int(variables[22])){
          modes.set(i, true);
       }else{
         modes.set(i, false);
       }
    }
}