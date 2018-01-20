
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