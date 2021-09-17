class SpikeShep
{
 
  PVector mouse;
  PVector DistRange;
  
  PVector location;
  PImage spikeShepImage;
  
  float radius;
  float speed;
  
  float tempSpeed;
  float tempRadius;
  
  float time;
  
  ArrayList<Projectile> projectiles;
  
  SpikeShep(PVector position, float radius, float speed)
  {
     time = 0;
    projectiles = new ArrayList<Projectile>();
    location = position;
    
    this.radius = radius;
    this.speed = speed;
    
    tempRadius = radius;
    tempSpeed = speed;
    
  }
  
  void setup()
{
 
  spikeShepImage = loadImage("SPIKE SHEP.png");
  
}
  
  void loop(ArrayList<Sommerfugl> list, ArrayList<SupportShep> supports)
  {
    speed = tempSpeed;
  radius = tempRadius;
  
  for(int i = 0; i < supports.size(); i++)
  {
   PVector temp = PVector.sub(location, supports.get(i).location);
    float dist = sqrt(temp.x*temp.x+temp.y*temp.y);
    
    if(dist < supports.get(i).range)
    {
     
      //GET BUFFS (ATTACKSPEEDBUFF ATTACKRANGBUFF)
     
     speed = tempSpeed + supports.get(i).attackSpeedBuff;
     radius = tempRadius + supports.get(i).rangeBuff;
     


      break;
      
    }
    
  }
    
    
    time += 1 / (float)30;
 
    for(int i = 0; i < projectiles.size(); i++)
    {
      projectiles.get(i).Display(list);
      
      
      
    }
       // Viser radiussen af spikeshep
       push();
          mouse = new PVector(mouseX,mouseY);  
            DistRange = mouse.sub(location);

    translate(location.x,location.y);
            if(DistRange.mag() < 30){
      noStroke();
      fill(100,100,100,101);
      circle(0,0,radius*2);
    } 
      pop();
    
    
    imageMode(CENTER);
    image(spikeShepImage, location.x, location.y);
    imageMode(CORNER);
    
    //CHeck om der er sommerfugle i range
    if(time > 1/speed)
    {
      
      for(int i = 0; i < list.size(); i++)
    {
     if(list.get(i).lives <= 0)
     {
      continue; 
     }
      
      PVector temp = PVector.sub(list.get(i).location, location);
      float dist = sqrt(temp.x*temp.x+temp.y*temp.y);
      
      if(dist < radius)
      {
        
        time = 0;
        ThrowSpikes();
      }
      
    }
    }
    
  }
  
  void ThrowSpikes()
  {
    float k = 3;
    float angle = 0;
    
    for(int i = 0; i < 8; i++)
    {
      Projectile temp = new Projectile("dart",location.x, location.y, cos(angle) * k + location.x, sin(angle) * k + location.y, 20, 1, 0.2); 
      
      temp.setup();
      projectiles.add(temp);
      
      
      angle += PI/4;
      
    }
        
    //lav på et tidspunkt
  }
  
  
}
