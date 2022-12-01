class Food
{
  float healthValue;
  float flavorValue;
  float liklyGoodStill;
  int rottenChance;
  String type;
  boolean spoiled;
  Food(float hV, float fV, float lGS, String t) {
    foodCounter+=1;
    foodInFridge.add(this);
    healthValue = hV;
    flavorValue = fV;
    liklyGoodStill = lGS;
    rottenChance=0;
    type =t;
    spoiled=false;
  }

  void foodExpieryAllDown() {
    for (int i =0; i<foodCounter; i++) {
      if (foodInFridge.get(i).liklyGoodStill>0) {
        foodInFridge.get(i).liklyGoodStill-=1;
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
