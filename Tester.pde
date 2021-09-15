ArrayList<Throwing_shep> ThrowingSheps = new ArrayList(); 


void setup(){
}

void settings() {
  size(1500,927);

}


void draw () {
  background(160, 222, 113);
    for(int i = 0; i < ThrowingSheps.size(); i++){
    ThrowingSheps.get(i).setup();
    }
  for(int i = 0; i < ThrowingSheps.size();i++){
    ThrowingSheps.get(i).loop();
    
  }
}

void mousePressed(){
  ThrowingSheps.add(new Throwing_shep("SpearShep",random(1500),random(927),0,0));
}
