class SpikeShep
{
 
  PVector location;
  PImage spikeShepImage;
  
  SpikeShep(PVector position)
  {
    location = position;
    
    
    
    
  }
  
  void setup()
{
 
  spikeShepImage = loadImage("SPIKE SHEP.png");
  
}
  
  void loop()
  {
    imageMode(CENTER);
    image(spikeShepImage, location.x, location.y);
    imageMode(CORNER);
    
    //CHeck om der er sommerfugle i range
  }
  
  void ThrowSpikes()
  {
    
    //lav på et tidspunkt
  }
  
  
}
