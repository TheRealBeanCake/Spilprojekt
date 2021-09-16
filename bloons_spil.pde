
ArrayList<Projectile> projectiles = new ArrayList();
ArrayList<Throwing_shep> ThrowingSheps = new ArrayList(); 

PImage background_;

PImage dart, super_shep_dart, spear_shep_dart;




void setup()
{
 size(1500,927);
 dart = loadImage("DART.png"); super_shep_dart = loadImage("SUPER SHEP DART.png"); spear_shep_dart = loadImage("SPEAR SHEP DART.png");
 background_ = loadImage("background.png");
   
 image(background_,0,0);
 frameRate(30);
 
 
 ThrowingSheps.add(new Throwing_shep("SalivaShep",20,20,0,0));
 ThrowingSheps.add(new Throwing_shep("SigmaShep",500,500,0,0));
 ThrowingSheps.add(new Throwing_shep("SpearShep",700,700,0,0));
 
 
}


void draw()
{
  
  /*
  dart_vel.x = mouseX-dart_loc.x; dart_vel.y = mouseY-dart_loc.y;
  dart_vel.normalize();
  dart_vel.x *= 10; dart_vel.y *= 10;
  */
  
  
  
  image(background_,0,0);
  
  for(int i = 0; i < projectiles.size(); i++)
  {
    projectiles.get(i).Display();
  }
  
  
  
  
  for(int i = 0; i < ThrowingSheps.size(); i++){
    ThrowingSheps.get(i).setup();
    }
  for(int i = 0; i < ThrowingSheps.size();i++){
    ThrowingSheps.get(i).loop();
  }
  
}


void mousePressed()
{
  projectiles.add(new Projectile("dart",20,20,mouseX,mouseY, 10));
  projectiles.add(new Projectile("super_shep_dart",500,500,mouseX,mouseY, 30));
  projectiles.add(new Projectile("spear_shep_dart",700,700,mouseX,mouseY, 15));

  println(projectiles.size());


}
