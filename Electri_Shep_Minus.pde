class ElectricShepMinus
{
 
  PVector location;
  PImage electricShepMinusImage;
  
  ElectricShepMinus(PVector position)
  {
    location = position;
    
    
    
    
  }
  
  void setup()
{
 
  electricShepMinusImage = loadImage("electric shep -.png");
  
}
  
  void loop()
  {
    imageMode(CENTER);
    image(electricShepMinusImage, location.x, location.y);
    imageMode(CORNER);
    
    //CHeck om der er electric shep positive i nærheden
  }
  
  void Electrocute()
  {
    
    //lav på et tidspunkt
  }
  
  
}
