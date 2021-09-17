class Projectile

{
  
 PVector velocity;
 PVector location;
 String type;
 
 PImage dart, super_shep_dart, spear_shep_dart, gun_shep_dart;
 
 int lives;
 
 boolean dead;
 
 ArrayList<Sommerfugl> hit;
 
float timer;

float timeAlive;
 
 Projectile(String s, float x_, float y_, float mx, float my, float vel, int live, float timeAlive)
 {
  hit = new ArrayList<Sommerfugl>();
   dead = false;
   location = new PVector(x_,y_);
   velocity = new PVector(mx-x_,my-y_);
   velocity.normalize();
   velocity.x *= vel; velocity.y *= vel;
   type = s;
   
   lives = live;
   
   this.timeAlive = timeAlive;
   
 }
 
 
 void setup()
 {
    dart = loadImage("DART.png"); super_shep_dart = loadImage("SUPER SHEP DART.png"); spear_shep_dart = loadImage("SPEAR SHEP DART.png"); gun_shep_dart = loadImage("GUN SHEP DART.png");

 }
 
 
 void Display(ArrayList<Sommerfugl> list)
 {

   if(dead == true)
   {
    return; 
   }
   
   timer += 1 / (float)30;
   
   if(timer > timeAlive)
   {
    dead = true; 
   }
   
   location.x += velocity.x; location.y += velocity.y;

      push();
      translate(location.x, location.y);
      imageMode(CENTER);
      
      if(velocity.x < 0)
      {
        rotate(atan(velocity.y/velocity.x)+PI/2+PI);
      }
      else
      {
        rotate(atan(velocity.y/velocity.x)+PI/2);
      }



  if(type == "dart")
  {
    image(dart,0,0);
    
    //CHeck collision med sommerfugl
    for(int i = 0; i < list.size(); i++)
    {
     PVector temp = PVector.sub(location, list.get(i).location);
     
      float dist  = sqrt(temp.x*temp.x+temp.y*temp.y);
      
      if(dist < 50 && list.get(i).lives > 0)
      {
       //COLLISION
       list.get(i).lives -= 1;
       lives -= 1;
       hit.add(list.get(i));
      }  
    }
  }
  if(type == "spear_shep_dart")
  {
    image(spear_shep_dart,0,0);
    
    //CHeck collision med sommerfugl
    for(int i = 0; i < list.size(); i++)
    {    
      PVector temp = PVector.sub(location, list.get(i).location);
     
      float dist  = sqrt(temp.x*temp.x+temp.y*temp.y);
      
      if(dist < 50 && list.get(i).lives > 0)
      {
       //COLLISION
       list.get(i).lives -= 1;
       lives -= 1;
       hit.add(list.get(i));
      }   
    }
  }
  if(type == "super_shep_dart")
  {
  image(super_shep_dart,0,0);
  
  //CHeck collision med sommerfugl
    for(int i = 0; i < list.size(); i++)
    {
     PVector temp = PVector.sub(location, list.get(i).location);
     
      float dist  = sqrt(temp.x*temp.x+temp.y*temp.y);
      
      if(dist < 10 && list.get(i).lives > 0)
      {
       //COLLISION
       list.get(i).lives -= 1;
       lives -= 1;
       hit.add(list.get(i));
      }   
      
      
      
    }
  }
  if(type == "gun_shep_dart")
  {
  image(gun_shep_dart,0,0);
  
  //CHeck collision med sommerfugl
    for(int i = 0; i < list.size(); i++)
    {
     PVector temp = PVector.sub(location, list.get(i).location);
     
      float dist  = sqrt(temp.x*temp.x+temp.y*temp.y);
      
      if(dist < 10 && list.get(i).lives > 0)
      {
       //COLLISION
       list.get(i).lives -= 1;
       lives -= 1;
       hit.add(list.get(i));
      }
      
      
      
    }
  }
  
  if(lives <= 0)
  {
    dead = true;
    //DEAD
  }
  
  pop();


 }
 
 
}
