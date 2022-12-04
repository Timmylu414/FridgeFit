import g4p_controls.*;

int timePassed = 0;
int foodCounter=0;
int n = 4;
int padding = 50;
int fridgeX = 25;
int fridgeY = 25;
int fridgeWidth = 425;
int fridgeHeight = 555;
Fridge f = new Fridge(fridgeX,fridgeY,fridgeWidth,fridgeHeight, padding, n);
Student ellie = new Student("Ellie", 16, 0.5, 0.8, 10, 10, f);


void setup() {
  //noLoop();
  frameRate(1);
  size(1000,650);
  background(0);
  f.assignStudent(ellie);
  drawText();
  createGUI();
  f.drawFridge();
  f.setFirstGen();
  f.drawFood();
  // show student's health
  //ellie.buyGroceries();

}

void draw() {
  background(0);
  f.drawFridge();
  drawText();
  timePassed += 1;
  println(timePassed);
  f.drawFood();
  f.setNextGen();
  ellie.eatFoodInFridge();
  //Similar to Cellular automata cells[] and use in the rest of the program, draw food if that space in fridge is occupied (boolean value or food class) basically if not empty
}

void drawText() {
  textSize(40);
  fill(255);
  text("The FridgeProject", 525,75);
  textSize(20);
  text("Timothy Lu", 525, 110);
  f.drawSpoiledFoodCounter(525, 150);
  ellie.displayHealth(525, 200);
}
