ArrayList<Sommerfugl> sommerfuglList = new ArrayList<Sommerfugl>();
ArrayList<Throwing_shep> throwingSheps = new ArrayList<Throwing_shep>();
ArrayList<SpikeShep> spikeSheps = new ArrayList<SpikeShep>();
ArrayList<SupportShep> supportSheps = new ArrayList<SupportShep>();
ArrayList<MoneyFarm> moneyFarms = new ArrayList<MoneyFarm>();
ArrayList<ElectricShepMinus> electricShepMinusList = new ArrayList<ElectricShepMinus>();
ArrayList<ElectricShepPlus> electricShepPlusList = new ArrayList<ElectricShepPlus>();
  
int totalCash = 0;
int totalLives = 100;
int queueNumber = 0;
boolean SoundMute = true;
boolean MusicMute = false;
 
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
 
}

void mousePressed()
{
  Sommerfugl LOL = new Sommerfugl((int)random(10));
  LOL.setup();
  sommerfuglList.add(LOL);
}
