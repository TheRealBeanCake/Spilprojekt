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
  
  
  int loop(int money, ArrayList<SupportShep> supports)
  {
    push();
    imageMode(CENTER);
    image(moneyFarmImage, location.x, location.y);
    pop();
    
    float r = 1;
    
    for(int i = 0; i < supports.size(); i++)
  {
   PVector temp = PVector.sub(location, supports.get(i).location);
    float dist = sqrt(temp.x*temp.x+temp.y*temp.y);
    
    if(dist < supports.get(i).range)
    {
     
      //GET BUFFS (ATTACKSPEEDBUFF ATTACKRANGBUFF)

     r = 1 + supports.get(i).rangeBuff;
     


      break;
      
    }
    
  }
    
    if(frameCount % (60 / r) == 0)
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
