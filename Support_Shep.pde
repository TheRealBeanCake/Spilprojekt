class SupportShep
{
 
  
  PVector location;
  PImage supportShepImage;
  
  float range;
  float attackSpeedBuff;
  float rangeBuff;
  
  SupportShep(PVector position, float range, float attackSpeedBuff, float rangeBuff)
  {
    location = position;
    this.range = range;
    this.attackSpeedBuff = attackSpeedBuff;
    this.rangeBuff = rangeBuff;
    
    
    
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
  
  
  
}
