class Sommerfugl
{
      PImage roed;PImage blue;PImage cyan;PImage green;PImage orange;PImage pink;PImage rainbow;PImage yellow;

PVector[] path = {new PVector(0, 234), new PVector(126, 115), new PVector(318, 297), new PVector(111, 504), new PVector(356, 748), new PVector(521, 600), new PVector(389, 470), new PVector(606, 257), new PVector(744, 395), new PVector(882, 395), new PVector(884, 556), new PVector(698, 744), new PVector(803, 851), new PVector(1214, 452), new PVector(953, 190), new PVector(950, -50)};
int pathIndex;
PVector location;

int lives;
float speed;
float speedFactor;

Sommerfugl(int live)
{
  speedFactor = 3;
  pathIndex = 0;
  lives = live;
  location = path[0];
  
}

void setup()
{
 
  roed = loadImage("but red.png");
  blue = loadImage("but blue.png");
  cyan = loadImage("but cyan.png");
  green = loadImage("but green.png");
  orange = loadImage("but orange.png");
  pink = loadImage("but pink.png");
  rainbow = loadImage("but rainbow.png");
  yellow = loadImage("but yellow.png"); 
  
}


// 1 : but red, 2 : but blue, 3 : but cyan, 4 : but green, 5 : but orange, 6 : but pink, 7 : but yellow, 8-10, but rainbow

void loop()
{
  //status
  
  boolean dead = false;
  imageMode(CENTER);
  
  if(lives <= 0)
  {
    //død
    dead = true;
    return;
  }
  
  switch(lives)
  {
    case 1:
    // rød
    speed = 1;
    
    image(roed, location.x, location.y);
    break;
    case 2:
    //blue
    speed = 2;
    image(blue, location.x, location.y);
    break;
    case 3:
    // cyan
    speed = 2;
    image(cyan, location.x, location.y);
    break;
    case 4:
    // green
    speed = 4;
    image(green, location.x, location.y);
    break;
    case 5:
    // orange
    speed = 5;
    image(orange, location.x, location.y);
    break;
    case 6:
    // pink
    speed = 6;
    image(pink, location.x, location.y);
    break;
    case 7:
    // yellow
    speed = 8;
    image(yellow, location.x, location.y);
    break;
    default:
    // rainbow
    speed = 10;
    image(rainbow, location.x, location.y);
    break;
  }
  imageMode(CORNER);
  
  
  //Bevægelse
  
  
  if(pathIndex + 1 >= path.length)
    {
      
      return;
    }
  
  PVector dir = PVector.sub(path[pathIndex + 1],path[pathIndex]);
  PVector transformation = new PVector(dir.normalize().x * speed * speedFactor, dir.normalize().y * speed * speedFactor);
  
  PVector newLocation = PVector.add(location,transformation);
  
  if(!(abs(dir.normalize().x - PVector.sub(path[pathIndex + 1],location).normalize().x) < 0.01) || !(abs(dir.normalize().y - PVector.sub(path[pathIndex + 1],location).normalize().y) < 0.01))
  {
    // new path

    
    lives -= 1;
    pathIndex += 1;
    location = path[pathIndex];
    
  }
  else
  {
    location = newLocation;
  }
  
  
}
  
}
