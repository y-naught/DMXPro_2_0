class RotatingBar{
  
  float ang = 0;
  float speed = PI/64;
  
  RotatingBar(){
    
  }
  
  void update(PGraphics g, color tmp1, color tmp2){
    PImage temp = createImage(g.width, g.height, RGB);
     g.beginDraw();
     g.background(0);
     temp.loadPixels();
     color c1 = tmp1;
     color c2 = tmp2;
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
    temp.resize(300,700);
    g.translate(g.width/2, g.height/2);
    g.rotate(ang);
    g.image(temp, 0, 0);
    ang+=speed;
    g.endDraw();
  }
  
}