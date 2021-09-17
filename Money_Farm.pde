
class MoneyFarm
{
  PVector location;
  PImage moneyFarmImage;
  
  int count = 0;
  
  MoneyFarm(PVector position)
  {
   location = position;
    
    
  }
  
  
  void setup() 
  {
   
    moneyFarmImage = loadImage("MONEY FARM.png");
    
    
  }
  
  
  int loop(int money)
  {
    push();
    imageMode(CENTER);
    image(moneyFarmImage, location.x, location.y);
    pop();
    
    
    if(frameCount % 60 == 0)
    {
      money += 20;
      count = 30;
    }
    
    if(count > 1)
    {
     push();
     textSize(50);
     textMode(CENTER);
     text("+$" + 20, location.x, location.y+100);
     count -= 1;
     pop();
    }
    
    
    return money;
    
    
    
    
  }
  
}
