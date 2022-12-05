import g4p_controls.*;
float healthiness;
boolean pressed;
int timePassed = 0;
int foodCounter=0;
int n = 4;
int padding = 50;
int fridgeX = 25;
int fridgeY = 25;
int fridgeWidth = 425;
int fridgeHeight = 555;
int radius = 28;

Fridge f = new Fridge(fridgeX, fridgeY, fridgeWidth, fridgeHeight, radius, padding, n);
Student ellie = new Student("Ellie", 16, healthiness/10, 0.8, 10, 10, f);


void setup() {
  //noLoop();
  frameRate(3);
  size(1000, 650);
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

void reset() {
  size(1000, 650);
  background(0);
  resetValues();
  drawText();
  f.drawFridge();
  f.setFirstGen();
  f.drawFood();
}

void resetValues() {
  ellie = new Student("Ellie", 16, healthiness/10, 0.8, 10, 10, f);
  f = new Fridge(fridgeX, fridgeY, fridgeWidth, fridgeHeight, radius, padding, n);
  f.assignStudent(ellie);
}

void drawText() {
  textSize(40);
  fill(150);
  stroke(255);
  strokeWeight(4);
  rect(510, 25, 600, 130, 25);
  noStroke();
  fill(255);
  text("The", 525, 90);
  textSize(50);
  text("FridgeProject", 600, 90);
  textSize(20);
  text("Timothy, Ellie, Roy", 525, 130);
  text("Days Passed: " + timePassed, 525, 200);
  f.drawSpoiledFoodCounter(525, 250);
  ellie.displayHealth(525, 300);
}
