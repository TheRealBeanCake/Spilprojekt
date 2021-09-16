
class Projectile

{
  
 PVector velocity;
 PVector location;
 String type;
 
 
 
 Projectile(String s, float x_, float y_, float mx, float my, float vel)
 {
   location = new PVector(x_,y_);
   velocity = new PVector(mx-x_,my-y_);
   velocity.normalize();
   velocity.x *= vel; velocity.y *= vel;
   type = s;
   
   
   
   
   
 }
 
 
 void setup()
 {
    

 }
 
 
 void Display()
 {
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
  }
  if(type == "spear_shep_dart")
  {
    image(spear_shep_dart,0,0);
  }
  if(type == "super_shep_dart")
  {
  image(super_shep_dart,0,0);
  }
  if(type == "gun_shep_dart")
  {
  image(gun_shep_dart,0,0);
  }
  pop();


 }
 
 
}
 
  
  
  
  
