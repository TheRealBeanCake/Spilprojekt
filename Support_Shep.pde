class SupportShep
{
 
  PVector location;
  PImage supportShepImage;
  
  SupportShep(PVector position)
  {
    location = position;
    
    
    
    
  }
  
  void setup()
{
 
  supportShepImage = loadImage("SUPPORT SHEP.png");
  
}
  
  void loop()
  {
    imageMode(CENTER);
    image(supportShepImage, location.x, location.y);
    imageMode(CORNER);
    
    //CHeck om der er andre SHEP i nærheden
  }
  
  void DoHealing()
  {
    
    //lav på et tidspunkt
  }
  
  
}
