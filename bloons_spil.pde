ArrayList<Sommerfugl> testList = new ArrayList<Sommerfugl>();
 MoneyFarm farm = new MoneyFarm(new PVector(400, 200));
  SpikeShep s = new SpikeShep(new PVector(400, 300), 100, 1);
 SupportShep z = new SupportShep(new PVector(600, 125));
 ElectricShepMinus k = new ElectricShepMinus(new PVector(800, 125));
  ElectricShepPlus u = new ElectricShepPlus(new PVector(800, 225));
  Throwing_shep testShep = new Throwing_shep("SpearShep", 200, 500, 5, 50);
  Throwing_shep testShep1 = new Throwing_shep("SalivaShep", 400, 500, 30, 1000);
  
void setup()
{
  size(1500, 927);
  

 farm.setup();
 s.setup();
 z.setup();
 k.setup();
 u.setup();
 testShep.setup();
 testShep1.setup();
}

void draw()
{
  
 clear();
 
 imageMode(CORNER);
 image(loadImage("background.png"), 0, 0);
  
  for(int i = 0; i < testList.size(); i++)
  {
   testList.get(i).loop(); 
  }
  
  
  farm.loop();
   s.loop(testList);
   z.loop();
  k.loop();
 u.loop();
 testShep.loop(testList);
 testShep1.loop(testList);
}

void mousePressed()
{
  Sommerfugl LOL = new Sommerfugl((int)random(10));
  LOL.setup();
  testList.add(LOL);
}
