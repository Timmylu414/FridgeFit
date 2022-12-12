import g4p_controls.*;

//Initial variables that are passed into class constructors

boolean pressed=true;
int timePassed = 0;
int foodCounter=0;
int padding = 50;
int fridgeX = 40;
int fridgeY = 25;
int fridgeWidth = 425;
int fridgeHeight = 555;
int radius = 28;

//These variables can be changed through GUI but have initial values at the start
float h = 6;
float spoilRate = 6;
int shoppingFrequency = 6;
int selfControl = 20;
int fr = 3;
String fridgeSize = "medium";


Fridge f = new Fridge(fridgeX, fridgeY, fridgeWidth, fridgeHeight, radius, padding, fridgeSize, spoilRate/50, shoppingFrequency);
Student ellie = new Student("Ellie", 16, h/10, selfControl, f);

void setup() {
  //println(spoilRate);
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
  size(1000, 650);
  background(0);
  resetValues();
  drawText();
  f.drawFridge();
  f.setFirstGen();
  f.drawFood();
}

void resetValues() {  //resets values for classes and timePassed
  ellie = new Student("Ellie", 16, h/10, selfControl, f);
  f = new Fridge(fridgeX, fridgeY, fridgeWidth, fridgeHeight, radius, padding, fridgeSize, spoilRate/50, shoppingFrequency);
  f.assignStudent(ellie);
  timePassed = 0;
}

//Drawing text on the window for users to see 
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

void gameOver() {
  background(0);
  noLoop();
  pressed = false;
  textSize(100);
  fill(255,0,0);
  text("GAME OVER", 200, 300);
  textSize(20);
}
