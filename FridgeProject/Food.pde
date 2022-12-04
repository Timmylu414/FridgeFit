class Food
{
  int healthValue;
  float flavorValue;
  float likelyGoodStill;
  int rottenChance;
  String type;
  float freshness;
  boolean spoiled;
  int totalHealthValue;
  
  
  Food(int hV, float fV, float lGS, String t, float f) {
    foodCounter+=1;
    foodInFridge.add(this);
    healthValue = hV;
    flavorValue = fV;
    likelyGoodStill = lGS;
    rottenChance=0;
    type =t;
    spoiled=false;
    this.freshness = f;
  }
  
  void totalHealthValue(){
    for (int i=0; i<foodCounter; i++){
      totalHealthValue = totalHealthValue + this.healthValue;
    }
  }

  void foodExpiryAllDown() {
    for (int i =0; i<foodCounter; i++) {
      if (foodInFridge.get(i).likelyGoodStill>0) {
        foodInFridge.get(i).likelyGoodStill-=1;
      } else {
        int willItRot = int(random(100));
        rottenChance+=5;
        if (willItRot < foodInFridge.get(i).rottenChance) {
          foodInFridge.get(i).spoiled=true;
        }
      }
    }
  }
  void removeSpoiledFood() {
    for (int i =0; i<foodCounter; i++) {
      if (foodInFridge.get(i).spoiled) {
        foodInFridge.remove(i);
        i-=1;
        foodCounter-=1;
      }
    }
  }
  void drawFood(){}
}
