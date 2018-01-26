class BouncingBalls{
  
  ArrayList<Ball> Balls;
  int col1;
  int col2;
  float speed;
  float size;
  int numBalls;
  
  BouncingBalls(){
    col1 = 0;
    col2 = 0;
    speed = 2;
    size = 20;
    numBalls = 20;
    Balls = new ArrayList<Ball>(numBalls);
    for(int i = 0; i < numBalls; i++){
       Balls.add(new Ball()); 
    }
  }
  
  
  void update(PGraphics g, int tmpCol1, int tmpCol2, int tmpNumBalls, float tmpSz, float tmpSpeed){
    
    col1 = tmpCol1;
    col2 = tmpCol2;
    numBalls = tmpNumBalls;
    size = tmpSz;
    speed = tmpSpeed;
    
    if(Balls.size() > numBalls){
      for(int i = 0; i < Balls.size() - numBalls; i++){
         Balls.remove(i); 
      }
    }
    if(Balls.size() < numBalls){
       for(int i = 0; i < numBalls - Balls.size(); i++){
           Balls.add(new Ball());
       }
    }
    
    g.beginDraw();
    g.background(col2);
    g.noStroke();
    for(int i = 0; i < Balls.size(); i++){
       Ball b = Balls.get(i);
       b.checkEdges();
       b.update(size, col1, speed);
       b.display(g);
    }
    g.endDraw();
  }
}

class Ball{
   
   PVector location;
   PVector velocity;
   int col = 0;
   float sz = 20;
  
    Ball(){
      location = new PVector(random(500), random(500));
      velocity = new PVector(random(-5, 5), random(-5, 5));
    }
    
    void checkEdges(){
      if(location.x < 0 || location.x > 500){
         velocity.x *= -1; 
      }
      if(location.y < 0 || location.y > 500){
         velocity.y *= -1; 
      }
    }
    
    void display(PGraphics g){
      g.fill(col);
      g.ellipse(location.x, location.y, sz, sz);
    }
    
    void update(float tmpSz, int tmpCol, float tmpSpeed){
      if(velocity.mag() != 0){
         velocity.normalize();
         velocity.mult(tmpSpeed);
      }else{
         velocity.set(new PVector(random(-1, 1), random(-1, 1)));
         velocity.mult(tmpSpeed);
      }
      
      location.add(velocity);
      col = tmpCol;
      sz = tmpSz;
    }
}