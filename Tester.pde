ArrayList<Sommerfugl> sommerfuglList = new ArrayList<Sommerfugl>();
ArrayList<Throwing_shep> throwingSheps = new ArrayList<Throwing_shep>();
ArrayList<SpikeShep> spikeSheps = new ArrayList<SpikeShep>();
ArrayList<SupportShep> supportSheps = new ArrayList<SupportShep>();
ArrayList<MoneyFarm> moneyFarms = new ArrayList<MoneyFarm>();
ArrayList<ElectricShepMinus> electricShepMinusList = new ArrayList<ElectricShepMinus>();
ArrayList<ElectricShepPlus> electricShepPlusList = new ArrayList<ElectricShepPlus>();
  
int totalCash;
  
void setup()
{
  size(1500, 927);
  
  totalCash = 0;
  
  supportSheps.add(new SupportShep(new PVector(250, 500), 50, 2, 100));
  moneyFarms.add(new MoneyFarm(new PVector(400, 200)));
electricShepMinusList.add(new ElectricShepMinus(new PVector(800, 125)));
electricShepPlusList.add(new ElectricShepPlus(new PVector(800, 225)));
spikeSheps.add(new SpikeShep(new PVector(400, 300), 100, 1));
throwingSheps.add(new Throwing_shep("SpearShep", 200, 500, 2, 50));
throwingSheps.add(new Throwing_shep("SalivaShep", 400, 500, 4, 1000));

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
  
  for(int i = 0; i < sommerfuglList.size(); i++)
  {
    if(sommerfuglList.get(i).IsDead() == true)
    {
     sommerfuglList.remove(i); 
    }
  }
  
 clear();
 
 imageMode(CORNER);
 image(loadImage("background.png"), 0, 0);
  
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
  moneyFarms.get(i).loop(totalCash, supportSheps); 
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
