import g4p_controls.*;
boolean pressed=true;
int timePassed = 0;
int foodCounter= 0;
//int n = 4;
int padding = 50;
int fridgeX = 40;
int fridgeY = 25;
int fridgeWidth = 425;
int fridgeHeight = 555;
int radius = 28;
float healthiness;
float spoilRate;
int shoppingFrequency;

String studentName = "User";
int FR = 3;
int n = 4;
boolean resetProgram;


Fridge f = new Fridge(fridgeX, fridgeY, fridgeWidth, fridgeHeight, radius, padding, n, spoilRate/50, shoppingFrequency);
Student student = new Student(studentName, 16, healthiness/10, f);


void setup() {
  println(spoilRate);
  frameRate(FR);
  size(1000, 650);
  background(0);
  f.assignStudent(student);
  drawText();
  createGUI();
  f.drawFridge();
  f.setFirstGen();
  f.drawFood();  
  student.chooseEat();
}

void draw() {
  background(0);
  f.drawFridge();
  drawText();
  timePassed += 1;
  println(timePassed);
  f.drawFood();
  f.setNextGen();
  student.chooseEat();
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
  student = new Student("Ellie", 16, healthiness/10, f);
  f = new Fridge(fridgeX, fridgeY, fridgeWidth, fridgeHeight, radius, padding, n, spoilRate/50, shoppingFrequency);
  f.assignStudent(student);
  timePassed = 0;
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
  student.displayHealth(525, 300);
}

void gameOver() {
  noLoop();
  //rect(0, 0, 1000, 650);
  fill(255, 0, 0);
  textSize(100);
  text("YOU DIED", 200, 325);
  textSize(12);
  if (resetProgram == true){
    reset();
  }
}
