class Food
{
float healthValue;
float flavorValue;
float liklyGoodStill;
String type;
boolean spoiled;
Food(float hV,float fV,float lGS,String t){
foodCounter+=1;
foodInFridge.add(this);
healthValue = hV;
flavorValue = fV;
liklyGoodStill = lGS;
type =t;
spoiled=false;

}

void foodExpieryAllDown(){}
}

void spoilFood() {
  //depending on expiry date, and random chance, set spoiled = true;
}
