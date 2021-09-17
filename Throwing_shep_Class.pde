class Throwing_shep {
  PVector location;
  PVector DistRange; PVector mouse;
  float FireRate;
  float DetectionRange;
  String shep;
  PImage SalivaShep;
  PImage SuperShep;
  PImage GunShep;
  PImage SpearShep;
  PImage SigmaShep;
  float angle;

  Throwing_shep (String s, float locX, float locY, float FR, float DecR) {
    location = new PVector(locX, locY);
    FireRate = FR;
    DetectionRange = DecR;
    shep = s;
  }

  void setup() { //Bilederne loades
    SalivaShep = loadImage("SHEP.png");
    SuperShep = loadImage("SUPER SHEP.png");
    GunShep = loadImage("GUN SHEP(1).png");
    SpearShep = loadImage("SPEAR SHEP.png");
    SigmaShep = loadImage("SIGMA SHEP.png");
  }
  void loop() { //Definition for vinklen som le sheps skal roteres med
    angle = atan((mouseY-location.y)/(mouseX-location.x))+(PI/2);
    if ((mouseX-location.x) < 0) {
      angle += PI;
    }
    //Denne PVector er til test, mus skal ikke være en PVector i det rigtige program
    mouse = new PVector(mouseX,mouseY);
    DistRange = mouse.sub(location);
    push(); // Fårene tegnes og roteres, alt efter hvilken string man har indsat
    imageMode(CENTER);
    translate(location.x, location.y);
    if (DistRange.mag() < DetectionRange) {
      rotate(angle);
    }
      if(DistRange.mag() < 30){
      noStroke();
      fill(100,100,100,101);
      circle(0,0,DetectionRange*2);
    } 
    switch(shep) {
    case "SalivaShep":
      image(SalivaShep, 0, 0);
      break;
    case "SuperShep":
      image(SuperShep, 0, 0);
      break;
    case "GunShep":
      image(GunShep, 0, 0);
      break;
    case "SpearShep":
      image(SpearShep, 0, 0);
      break;
    case "SigmaShep":
      image(SigmaShep, 0, 0);
      break;
    }
    pop();
  }
}
