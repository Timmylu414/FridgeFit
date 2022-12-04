class Food
{
  float healthValue;
  float flavorValue;
  float liklyGoodStill;
  int rottenChance;
  String type;
  float freshness;
  boolean spoiled;
  int i;
  int j;
  color foodColor;
  
  Food(float hV, float fV, float lGS, String t, float f, int i, int j) {
    foodCounter+=1;
    healthValue = hV;
    flavorValue = fV;
    liklyGoodStill = lGS;
    rottenChance=0;
    type =t;
    spoiled=false;
    this.freshness = f;
    this.i = i;
    this.j = j;
    updateFoodColor();
  }
  
  void updateFoodColor() {
    colorMode(HSB, 360, 100, 100);
    foodColor = color(50 * (1 + healthValue), 100, freshness*100);
    colorMode(RGB, 255);
  }

  //void foodExpieryAllDown() {
  //  for (int i =0; i<foodCounter; i++) {
  //    if (foodInFridge.get(i).liklyGoodStill>0) {
  //      foodInFridge.get(i).liklyGoodStill-=1;
  //    } else {
  //      int willItRot = int(random(100));
  //      rottenChance+=5;
  //      if (willItRot < foodInFridge.get(i).rottenChance) {
  //        foodInFridge.get(i).spoiled=true;
  //      }
  //    }
  //  }
  //}
  //void removeSpoiledFood() {
  //  for (int i =0; i<foodCounter; i++) {
  //    if (foodInFridge.get(i).spoiled) {
  //      foodInFridge.remove(i);
  //      i-=1;
  //      foodCounter-=1;
  //    }
  //  }
  //}
}
