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

Throwing_shep (String s, float locX, float locY, float FR, float DecR){
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
void loop(){ 
  angle = atan((mouseY-location.y)/(mouseX-location.x))+(PI/2);
  if((mouseX-location.x) < 0){
    angle += PI;
  }
push();
imageMode(CENTER);
  translate(location.x,location.y);
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
