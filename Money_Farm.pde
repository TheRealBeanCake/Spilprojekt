class MoneyFarm
{
  PVector location;
  PImage moneyFarmImage;
  
  PVector rand;
  
  int count = 0;
  
  ArrayList<CashText> cashText = new ArrayList<CashText>();
  
  MoneyFarm(PVector position)
  {
   cashText = new ArrayList<CashText>();
    
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

     r = 1 + supports.get(i).attackSpeedBuff;
     


      break;
      
    }
    
  }
  
  
    println(round((60 / r)));
    if(frameCount % round((60 / r)) == 0)
    {
      money += 20;
      count = 30;
      
     cashText.add(new CashText(new PVector(location.x + random(100) - 100, location.y+random(100) - 100), "+$" + 20, 30));
    }
    
     for(int i = 0; i < cashText.size(); i++)
     {
       if(cashText.get(i).duration < 1)
       {
        cashText.remove(i); 
       }
       
       push();
     textSize(50);
     textMode(CENTER);
     text(cashText.get(i).text, cashText.get(i).location.x, cashText.get(i).location.y);
     pop();
       
       cashText.get(i).duration -= 1;
       
       
     }
    
    if(count > 1)
    {
     
    }
    
    
    return money;
    
    
    
    
  }
  
}

class CashText
{
 PVector location;
 String text;
 int duration;
 
 CashText(PVector location, String text, int duration)
 {
   this.location = location;
   this.text = text;
   this.duration = duration;
 }
  
}
