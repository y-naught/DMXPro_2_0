
class Shower{
   
    ArrayList<Particle> particles;
    int perFrame;
    float sz;
    int col;
    Boolean colSw;
    float speed = 10;
    
    Shower(int count, float s){
        particles = new ArrayList<Particle>();
        perFrame = count;
        sz = s;
        colSw = true;
    }
    
    void run(PGraphics g, int wid, int cTemp, float tempSp, float si, int numPart){
        col = cTemp;
        speed = tempSp;
        perFrame = numPart;
        sz = si;
      for(int i = 0; i < perFrame; i++){
          particles.add(new Particle(sz, wid)); 
      }
      
      for(int i = 0; i < particles.size(); i++){
          Particle p = particles.get(i);
          if(p.isDead()){
             particles.remove(i);
          }else{
             g.beginDraw();
             p.update(speed, colSw, col, int(sz));
             p.display(g);
             g.endDraw();
          }
       }
    }
}

class Particle{
   
   PVector location;
   PVector velocity;
   
   int colorPP;
   
   float sz;
   float speed;
   int startFrame;
   
   Particle(float s, int w){
      location = new PVector(random(0, w), 0);
      velocity = new PVector(0, random(3, 7));
      
      sz = s;
      startFrame = frameCount;
      
      //for implementing random color offset for the particles
      float rand = random(1);
      if(rand < 0.15){
        
      }
      else if(rand >= 0.15 && rand < 0.30){
        
      }
      else{
        
      }
   }
   
   void update(float sp, Boolean oneC, int col, int si){
      speed = sp;
      sz = si;
      if(velocity.y == 0){
         velocity.y = 1; 
      }
      velocity.normalize();
      velocity.mult(speed);
      location.add(velocity);
      colorPP = col;
      //how it updates the color for random color offset
      if(oneC){
         colorPP = col;
      }else{
        colorPP = col;
      }
   }
   
   void display(PGraphics gTemp){
      //gTemp.beginDraw();
      gTemp.fill(colorPP);
      gTemp.ellipse(location.x, location.y, sz, sz);
      //gTemp.endDraw();
   }
   
   boolean isDead(){
     if(frameCount - startFrame > 1000){
       return true; 
     }else if(location.y > height){
       return true; 
     }else{
        return false; 
     }
   }
    
}