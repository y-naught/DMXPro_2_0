class RotatingBar{
  
  float ang = 0;
  float speed = PI/512;
  
  RotatingBar(){
    
  }
  
  void update(PGraphics g){
    PImage temp = createImage(g.width, g.height, RGB);
     g.beginDraw();
     g.background(0);
     temp.loadPixels();
     color c1 = color(255,0,0);
     color c2 = color(0,0,255);
     for(int i = 0; i < g.width; i++){
       for(int j = 0; j < g.height; j++){
           if(i < g.width/2){
             temp.pixels[i + j * g.width] = lerpColor(c1, c2, map(i, 0, g.width / 2, 0 , 1.0)); 
           }else{
             temp.pixels[i + j * g.width] = lerpColor(c1, c2, map(i, g.width / 2, g.width, 1.0 , 0));
           }
       }
     }
    temp.updatePixels();
   
    g.imageMode(CENTER);
    //g.translate(g.width/2, g.height/2);
    g.rotate(ang);
    g.image(temp, g.width/2, g.height/2);
    ang+=speed;
    g.endDraw();
  }
  
}