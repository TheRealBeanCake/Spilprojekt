class Throwing_shep {
PVector location;
float FireRate;
float DetectionRange;
String shep;
PImage SalivaShep;
PImage SuperShep;
PImage GunShep;
PImage SpearShep;
PImage SigmaShep;
float angle;
float timer;
PVector DistRange;
PVector mouse;
ArrayList<Projectile> projectiles;



Throwing_shep (String s, float locX, float locY, float FR, float DecR){

  projectiles = new ArrayList<Projectile>();
  timer = 0;
  location = new PVector(locX,locY);
FireRate = FR;
DetectionRange = DecR;
shep = s;

}

void setup() {
  SalivaShep = loadImage("SHEP.png");
  SuperShep = loadImage("SUPER SHEP.png");
  GunShep = loadImage("GUN SHEP(1).png");
  SpearShep = loadImage("SPEAR SHEP.png");
  SigmaShep = loadImage("SIGMA SHEP.png");
}
void loop(ArrayList<Sommerfugl> list){ 
  
  ArrayList<Sommerfugl> L = new ArrayList<Sommerfugl>();
  
  for(int i = 0; i < list.size(); i++)
  {
    if(!(list.get(i).lives <= 0))
    {
     L.add(list.get(i)); 
    }
  }
  
  for(int i = 0; i < projectiles.size(); i++)
  {
   projectiles.get(i).Display(L); 
  }
  
  timer += 1 / (float)30;
  
  float closest = DetectionRange + 1;
  int chosenIndex = -1;
  //FIND TARGET
  for(int i = 0; i < list.size(); i++)
  {
    if(list.get(i).lives <= 0)
    {
     continue;
    }
    //CALCULATE DISTANCE TO SOMMERFUGL
    float dist = sqrt(PVector.sub(list.get(i).location, location).x*PVector.sub(list.get(i).location, location).x+PVector.sub(list.get(i).location, location).y*PVector.sub(list.get(i).location, location).y); 

    if(dist < DetectionRange)
    {
      //POTENTIAL Target
      if(dist < closest)
      {
        closest = dist;
        chosenIndex = i;
      }
    }
}
  
  if(chosenIndex != -1)
  {
   PVector target = new PVector(list.get(chosenIndex).location.x, list.get(chosenIndex).location.y); 
   
   angle = atan((target.y-location.y)/(target.x-location.x))+(PI/2);
  if((target.x-location.x) < 0){
    angle += PI;
  }
  
  if(timer > 1/FireRate)
  {
   timer = 0;
    
    if(shep == "SalivaShep")
    {
      Projectile temp = new Projectile("dart",location.x,location.y,target.x,target.y, 30, 1);
      temp.setup();
      projectiles.add(temp);
      
      
    }
    if(shep == "SuperShep")
    {
      Projectile temp = new Projectile("super_shep_dart",location.x,location.y,target.x,target.y,30, 1);
      temp.setup();
      projectiles.add(temp);
    }
    if(shep == "GunShep")
    {
      Projectile temp = new Projectile("gun_shep_dart",location.x,location.y,target.x,target.y, 30, 1);
      temp.setup();
      projectiles.add(temp);
    }
    if(shep == "SpearShep")
    {
      Projectile temp = new Projectile("spear_shep_dart",location.x,location.y,target.x,target.y, 30, 5);
      temp.setup();
      projectiles.add(temp);
    }
    
  }
  
  }
      mouse = new PVector(mouseX,mouseY);
      DistRange = mouse.sub(location);
push();

imageMode(CENTER);
  translate(location.x,location.y);
        if(DistRange.mag() < 30){
      noStroke();
      fill(100,100,100,101);
      circle(0,0,DetectionRange*2);
    } 
  rotate(angle);
switch(shep){
  case "SalivaShep":
  image(SalivaShep,0,0);
  break;
  case "SuperShep":
  image(SuperShep,0,0);
  break;
  case "GunShep":
  image(GunShep,0,0);
  break;
  case "SpearShep":
  image(SpearShep,0,0);
  break;
  case "SigmaShep":
  image(SigmaShep,0,0);
  break;
}
   pop();
}
    
}
