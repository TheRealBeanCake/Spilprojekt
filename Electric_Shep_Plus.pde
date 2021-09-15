class ElectricShepPlus
{
 
  PVector location;
  PImage electricShepPlusImage;
  
  ElectricShepPlus(PVector position)
  {
    location = position;
    
    
    
    
  }
  
  void setup()
{
 
  electricShepPlusImage = loadImage("ELECTRIC SHEP +.png");
  
}
  
  void loop()
  {
    imageMode(CENTER);
    image(electricShepPlusImage, location.x, location.y);
    imageMode(CORNER);
    
  }
  
  
  
  
}
