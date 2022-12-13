import g4p_controls.*;

//Initial variables that are passed into class constructors

boolean pressed=true;
int timePassed = 0;
int foodCounter=0;
int padding = 50;
int fridgeX = 40;
int fridgeY = 25;
int fridgeWidth = 425;
int fridgeHeight = 550;
int radius = 20;

//These variables can be changed through GUI but have initial values at the start
String fridgeName = "User's Fridge";
float healthiness = 6;
float spoilRate = 6;
int shoppingFrequency = 6;
int selfControl = 20;
int fr = 3;
String fridgeSize = "medium";

Fridge f = new Fridge(fridgeX, fridgeY, fridgeWidth, fridgeHeight, radius, padding, fridgeSize, spoilRate/50, shoppingFrequency);
Student ellie = new Student("Ellie", 16, healthiness/10, selfControl, f);

void setup() {
  frameRate(fr);
  size(1000, 650);
  background(0);
  f.assignStudent(ellie);
  drawText();
  createGUI();
  f.drawFridge();
  f.setFirstGen();
  f.drawFood();  
  ellie.chooseEat();
}

void draw() {
  background(0);
  f.drawFridge();
  timePassed += 1;  //keeps track of how much time has passed in the program
  f.drawFood();
  f.setNextGen();
  ellie.chooseEat();
  drawText();
}

void reset() {  //Resets values and redraws text, fridge and food
  frameRate(fr);
  size(1000, 650);
  background(0);
  resetValues();
  drawText();
  f.drawFridge();
  f.setFirstGen();
  f.drawFood();
}

void resetValues() {  //resets values for classes and timePassed
  ellie = new Student("Ellie", 16, healthiness/10, selfControl, f);
  f = new Fridge(fridgeX, fridgeY, fridgeWidth, fridgeHeight, radius, padding, fridgeSize, spoilRate/50, shoppingFrequency);
  f.assignStudent(ellie);
  timePassed = 0;
}

//Drawing text on the window for users to see 
void drawText() {
  fill(150);
  stroke(255);
  strokeWeight(4);
  rect(510, 25, 600, 130, 15);
  noStroke();
  fill(255);
  textSize(50);
  text("FridgeFit", 520, 90);
  textSize(20);
  text("Timothy, Ellie, Roy", 525, 130);
  text("Days Passed: " + timePassed, 525, 200);
  text(fridgeName, 200, 610);
  ellie.displayStats(525, 250);
  textAlign(CENTER);
  textAlign(LEFT);
}

void gameOver() {  //Game over screen when student reaches 0 health
  background(0);
  noLoop();
  pressed = false;
  textSize(100);
  fill(255, 0, 0);
  textAlign(CENTER);
  text("GAME OVER", 500, 300);
  textSize(20);
  text("your lifestyle is not sustainable", 500, 350);
  text("press reset to try again", 500, 400);
}
