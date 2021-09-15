class MoneyFarm
{
 
  PVector location;
  PImage moneyFarmImage;
  
  MoneyFarm(PVector position)
  {
    location = position;
    
    
    
    
  }
  
  void setup()
{
 
  moneyFarmImage = loadImage("MONEY FARM.png");
  
}
  
  void loop()
  {
    imageMode(CENTER);
    image(moneyFarmImage, location.x, location.y);
    imageMode(CORNER);
  }
  
  void GiveMoney()
  {
    
    //lav på et tidspunkt
  }
  
  
}
