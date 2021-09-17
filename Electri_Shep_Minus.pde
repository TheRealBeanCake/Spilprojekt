class ElectricShepMinus
{
 
  PVector location;
  PImage electricShepMinusImage;
  int count = 0;
  int range;

  ElectricShepMinus(PVector position, int range_)
  {
    location = position;
    range = range_;
    
    
    
  }
  
  void setup()
{
 
  electricShepMinusImage = loadImage("electric shep -.png");
  
}
  
  void loop(PVector location_plus, PVector[] sommerfugle, ArrayList<Sommerfugl> list)
  {
    imageMode(CENTER);
    image(electricShepMinusImage, location.x, location.y);
    imageMode(CORNER);
    
    //CHeck om der er electric shep positive i nærheden
          for(int i = 0; i < sommerfugle.length; i++)
      {
       
       PVector v1 = new PVector((location.x-location_plus.x), ((height-location.y)-(height-location_plus.y)));
       PVector v1_ = v1;
       
       PVector v2 = new PVector((location.x-sommerfugle[i].x), ((height-location.y)-(height-sommerfugle[i].y)));
       PVector v2_ = v2;

       float v1l = v1_.mag();  
       float v2l = v2_.mag();  
         
       v1.normalize();
       v2.normalize();
       
       v1.x = round(v1.x*10); v1.y = round(v1.y*10);
       v2.x = round(v2.x*10); v2.y = round(v2.y*10);
       
       //println(sqrt(sq(v1_.x)+sq(v1_.y)), (sqrt(sq(v2_.x)+sq(v2_.y))));
       
       
       if(v1.x == v2.x && v1.y == v2.y && ((v1l > v2l) && frameCount % 10 == 0 && list.get(i).lives > 0) && v1l < range)
       {
         push();
         stroke(4,217,255);
         strokeWeight(7);
         line(location.x, location.y, location_plus.x, location_plus.y);
         pop();
         list.get(i).lives -= 1;
         
         
       }
       
        
    if(frameCount % 60 == 0)
    {
      
      }

      
      
      
      
    }
    
    
  }
  
  
  
}
