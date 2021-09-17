ArrayList<Sommerfugl> sommerfuglList = new ArrayList<Sommerfugl>();
ArrayList<Throwing_shep> throwingSheps = new ArrayList<Throwing_shep>();
ArrayList<SpikeShep> spikeSheps = new ArrayList<SpikeShep>();
ArrayList<SupportShep> supportSheps = new ArrayList<SupportShep>();
ArrayList<MoneyFarm> moneyFarms = new ArrayList<MoneyFarm>();
ArrayList<ElectricShepMinus> electricShepMinusList = new ArrayList<ElectricShepMinus>();
ArrayList<ElectricShepPlus> electricShepPlusList = new ArrayList<ElectricShepPlus>();
ArrayList<ShepButton> shepButtons = new ArrayList<ShepButton>();
  
int totalCash = 1000;
int totalLives = 100;
int queueNumber = 0;
boolean SoundMute = true;
boolean MusicMute = true;
 
boolean currentlyGrapping = false;
 
 import processing.sound.*;
 SoundFile CoolThing;
 SoundFile Chill;
 SoundFile Rich;
 SoundFile FirstBeat;
 SoundFile HitPop;
  
  void settings(){
      size(1500, 927);}
void setup()
{
  

  CoolThing = new SoundFile(this,"CoolThing(Beat).wav");
  Chill = new SoundFile(this,"Chill(Beat).wav");
  Rich = new SoundFile(this,"Rich(Beat).wav");
  FirstBeat = new SoundFile(this,"FirstBeat(Beat).wav");
  HitPop = new SoundFile(this,"HitSound.wav");
  
  supportSheps.add(new SupportShep(new PVector(250, 500), 500, 1, 100));
  moneyFarms.add(new MoneyFarm(new PVector(400, 200)));
electricShepMinusList.add(new ElectricShepMinus(new PVector(800, 125)));
electricShepPlusList.add(new ElectricShepPlus(new PVector(800, 225)));
spikeSheps.add(new SpikeShep(new PVector(400, 300), 100, 1));
throwingSheps.add(new Throwing_shep("SpearShep", 200, 500, 100, 50));

shepButtons.add(new ShepButton(new PVector(155,90), new PVector(1424,80), 300, "saliva shep"));
shepButtons.add(new ShepButton(new PVector(155,90), new PVector(1424, 180), 100, "super shep"));
shepButtons.add(new ShepButton(new PVector(155,90), new PVector(1424,280), 300, "sigma shep"));
shepButtons.add(new ShepButton(new PVector(155,90), new PVector(1424, 380), 100, "super shep"));
shepButtons.add(new ShepButton(new PVector(155,90), new PVector(1424,480), 300, "sigma shep"));
shepButtons.add(new ShepButton(new PVector(155,90), new PVector(1424, 575), 100, "super shep"));
shepButtons.add(new ShepButton(new PVector(155,90), new PVector(1424,665), 300, "sigma shep"));
shepButtons.add(new ShepButton(new PVector(155,90), new PVector(1424, 765), 100, "super shep"));
shepButtons.add(new ShepButton(new PVector(155,90), new PVector(1424, 860), 100, "super shep"));


 for(int i = 0; i < supportSheps.size(); i++)
 {
  supportSheps.get(i).setup(); 
 }
 
 for(int i = 0; i < moneyFarms.size(); i++)
 {
  moneyFarms.get(i).setup(); 
 }
 
 for(int i = 0; i < electricShepMinusList.size(); i++)
 {
  electricShepMinusList.get(i).setup(); 
 }
 
 for(int i = 0; i < electricShepPlusList.size(); i++)
 {
  electricShepPlusList.get(i).setup(); 
 }
 
 for(int i = 0; i < spikeSheps.size(); i++)
 {
  spikeSheps.get(i).setup(); 
 }
 
 for(int i = 0; i < throwingSheps.size(); i++)
 {
  throwingSheps.get(i).setup(); 
 }
 
 
}

void draw()
{
  
// Musik sergment starter her
if(FirstBeat.isPlaying() == true && MusicMute == true){FirstBeat.stop();}
if(Rich.isPlaying() == true && MusicMute == true){Rich.stop();}
if(Chill.isPlaying() == true && MusicMute == true){Chill.stop();}
if(CoolThing.isPlaying() == true && MusicMute == true){CoolThing.stop();}

if(MusicMute == false){
  if(CoolThing.isPlaying() == false && queueNumber == 0){
    FirstBeat.play();
    queueNumber += 1;
  } 
  if(FirstBeat.isPlaying() == false && queueNumber == 1){
    Rich.play();
    queueNumber += 1;
  } 
  if(Rich.isPlaying() == false && queueNumber == 2){
    Chill.play();
    queueNumber += 1;
  } 
  if(Chill.isPlaying() == false && queueNumber == 3){
    CoolThing.play();
    queueNumber -=3;
  } 
}

  
// Musik sergment slutter her 
  
  for(int i = 0; i < sommerfuglList.size(); i++)
  {
    if(sommerfuglList.get(i).IsDead() == true)
    {
     if(sommerfuglList.get(i).pathIndex + 1 >= sommerfuglList.get(i).path.length && sommerfuglList.get(i).hasReachedEnd == false)
    {
     sommerfuglList.get(i).hasReachedEnd = true;
      //ved enden af banen
      totalLives -= sommerfuglList.get(i).lives;
      
      
    }
      
      sommerfuglList.remove(i); 
    }
  }
  
 clear();
 
 imageMode(CORNER);
 image(loadImage("background.png"), 0, 0);
  
  int digits = str(totalCash).length();
  int k = 25;
  
  push();
     textSize(40);
     textMode(CENTER);
     text(totalCash + "$", 1290 - (k * digits), 50);
     pop();
  
  image(loadImage("CartoonHeart.png"), 1290, 70);
  
  digits = str(totalLives).length();
  
  push();
     textSize(40);
     textMode(CENTER);
     text(totalLives + "", 1285 - (k * digits), 100);
     pop();
  
  for(int i = 0; i < sommerfuglList.size(); i++)
  {
   sommerfuglList.get(i).loop(); 
  }
  
  
  for(int i = 0; i < supportSheps.size(); i++)
 {
  supportSheps.get(i).loop(); 
 }
 
 for(int i = 0; i < moneyFarms.size(); i++)
 {
  totalCash = moneyFarms.get(i).loop(totalCash, supportSheps); 
 }
 
 for(int i = 0; i < electricShepMinusList.size(); i++)
 {
  electricShepMinusList.get(i).loop(); 
 }
 
 for(int i = 0; i < electricShepPlusList.size(); i++)
 {
  electricShepPlusList.get(i).loop(); 
 }
 
 for(int i = 0; i < spikeSheps.size(); i++)
 {
  spikeSheps.get(i).loop(sommerfuglList, supportSheps); 
 }
 
 for(int i = 0; i < throwingSheps.size(); i++)
 {
  throwingSheps.get(i).loop(sommerfuglList, supportSheps); 
 }
 
 for(int i = 0; i < shepButtons.size(); i++)
 {
  if(currentlyGrapping)
  {
    if(shepButtons.get(i).grabbingShep == true)
    {
      int tempCash = totalCash;
      
      totalCash = shepButtons.get(i).loop(totalCash); 
      
      if(totalCash == -1)
      {
        switch(shepButtons.get(i).shep)
        {
      case "electric shep minus":
      ElectricShepMinus temp = new ElectricShepMinus(new PVector(mouseX, mouseY));
      temp.setup();
      electricShepMinusList.add(temp);
      break;
      case "electric shep plus":
      ElectricShepPlus temp1 = new ElectricShepPlus(new PVector(mouseX, mouseY));
      temp1.setup();
      electricShepPlusList.add(temp1);
      break;
      case "money farm":
      MoneyFarm temp2 = new MoneyFarm(new PVector(mouseX, mouseY));
      temp2.setup();
      moneyFarms.add(temp2);
      break;
      case "spike shep":
      SpikeShep temp3 = new SpikeShep(new PVector(mouseX, mouseY), 100, 1);
      temp3.setup();
      spikeSheps.add(temp3); //SCUFFED VÆRDIER
      break;
      case "support shep":
      SupportShep temp4 = new SupportShep(new PVector(mouseX, mouseY), 500, 1, 100);
      temp4.setup();
      supportSheps.add(temp4);
      break;
      case "saliva shep":
      Throwing_shep temp5 = new Throwing_shep("SalivaShep", mouseX, mouseY, 100, 50);
      temp5.setup();
      throwingSheps.add(temp5);
      break;
      case "super shep":
      Throwing_shep temp6 = new Throwing_shep("SuperShep", mouseX, mouseY, 100, 50);
      temp6.setup();
      throwingSheps.add(temp6);
      break;
      case "gun shep":
      Throwing_shep temp7 = new Throwing_shep("GunShep", mouseX, mouseY, 100, 50);
      temp7.setup();
      throwingSheps.add(temp7);
      break;
      case "spear shep":
      Throwing_shep temp8 = new Throwing_shep("GunShep", mouseX, mouseY, 100, 50);
      temp8.setup();
      throwingSheps.add(temp8);
      break;
      case "sigma shep":
      Throwing_shep temp9 = new Throwing_shep("SigmaShep", mouseX, mouseY, 100, 50);
      temp9.setup();
      throwingSheps.add(temp9);
      break;
          
        }
        
        
        totalCash = tempCash;
      }
    }
  }
  else
  {
    totalCash = shepButtons.get(i).loop(totalCash); 
  }
   
 }
 
 boolean c = false;
 
 for(int i = 0; i < shepButtons.size(); i++)
 {
  if(shepButtons.get(i).grabbingShep == true)
  {
   c = true;
  }
 }
 
 currentlyGrapping = c;
 
}

void mousePressed()
{
  Sommerfugl LOL = new Sommerfugl((int)random(10));
  LOL.setup();
  sommerfuglList.add(LOL);
}
