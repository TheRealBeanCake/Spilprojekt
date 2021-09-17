class ShepButton
{

  PVector dimensions;
  PVector location;
  int cost;
  PImage shepImage;
  boolean grabbingShep;
float shepRadius; //OPDATER VÆRDIER
String shep;

  public ShepButton(PVector dimensions, PVector location, int cost, String shep)
  {
    grabbingShep = false;
    this.dimensions = dimensions;
    this.location = location;
    this.cost = cost;
this.shep = shep;

    switch(shep)
    {
      case "electric shep minus":
      shepImage = loadImage("electric shep -.png");
      shepRadius = 20;
      break;
      case "electric shep plus":
      shepImage = loadImage("ELECTRIC SHEP +.png");
      shepRadius = 20;
      break;
      case "money farm":
      shepImage = loadImage("MONEY FARM.png");
      shepRadius = 0;
      break;
      case "spike shep":
      shepImage = loadImage("SPIKE SHEP.png");
      shepRadius = 20;
      break;
      case "support shep":
      shepImage = loadImage("SUPPORT SHEP.png");
      shepRadius = 50;
      break;
      case "saliva shep":
      shepImage = loadImage("SHEP.png");
      shepRadius = 100;
      break;
      case "super shep":
      shepImage = loadImage("SUPER SHEP.png");
      shepRadius = 250;
      break;
      case "gun shep":
      shepImage = loadImage("GUN SHEP(1).png");
      shepRadius = 150;
      break;
      case "spear shep":
      shepImage = loadImage("SPEAR SHEP.png");
      shepRadius = 250;
      break;
      case "sigma shep":
      shepImage = loadImage("SIGMA SHEP.png");
      shepRadius = 300;
      break;
    }

  }

  int loop(int totalCash)
  {
   
    if(grabbingShep == true)
    {
     
      if(mousePressed && mouseButton == RIGHT)
      {
       grabbingShep = false; 
        return totalCash + cost;
        
      }
      
      if(mousePressed && mouseButton == LEFT)
      {
       //PUT SHEP
        
        
        
        grabbingShep = false;
        return -1;
      }
      
      push();
      imageMode(CENTER);
      image(shepImage, mouseX, mouseY);
      
      PVector mouse = new PVector(mouseX,mouseY);  
            PVector DistRange = mouse.sub(location);

    translate(mouseX,mouseY);
      noStroke();
      fill(100,100,100,101);
      circle(0,0,shepRadius*2);
      
      pop();
      
      
      
    
    return totalCash;
    }
    float dx = dimensions.x / 2; float dy = dimensions.y / 2;

    boolean hovered = false;

    if(mouseX < dx + location.x && mouseX > location.x - dx && mouseY > location.y - dy && mouseY < location.y + dy)
    {
      //MOUSE HOVER

      hovered = true;

push();
imageMode(CENTER);
      image(shepImage, (location.x - dx)+dimensions.x/2, (location.y - dy)+dimensions.y/2);
pop();

     if(mousePressed == true)
     {
       if(totalCash >= cost)
      {
       //KØB
       grabbingShep = true;

       return totalCash - cost;

      }
      else
      {
        //HAR IKKE RÅD
      }
     }


    } 
    else
    {



    }

if(hovered == false)
{
  push();
    noStroke();
    fill(251, 191, 59);
    //rect(location.x - dx, location.y - dy, dimensions.x, dimensions.y);
    textAlign(CENTER);

    text("$" + cost, (location.x - dx)+dimensions.x/2, (location.y - dy)+dimensions.y/2);

    imageMode(CENTER);
    image(shepImage, (location.x - dx)+dimensions.x/2, (location.y - dy)+dimensions.y/2+25, 40, 40);

    pop();
}




    
return totalCash;
  }

 




  

}




 
 
 
