import g4p_controls.*;

int timePassed = 0;
ArrayList <Food> foodInFridge = new ArrayList<Food>();
int foodCounter=0;
int n = 4;
int padding = 50;
int fridgeX = 25;
int fridgeY = 25;
int fridgeWidth = 425;
int fridgeHeight = 555;
Fridge f = new Fridge(fridgeX,fridgeY,fridgeWidth,fridgeHeight, padding, n);
Student ellie = new Student("Ellie", 16, 0, 0, 0, f);


void setup() {
  //noLoop();
  
  frameRate(5);
  size(1000,650);
  background(0);
  
  textSize(40);
  fill(255);
  text("The FridgeProject", 525,75);
  textSize(20);
  text("Timothy Lu", 525, 110);
 
  createGUI();
  f.drawFridge();
  f.setFirstGen();
  f.drawFood();
  //ellie.buyGroceries();

}

void draw() {
  timePassed += 1;
  println(timePassed);
  f.drawFood();
  
  f.setNextGen();
  
  //Similar to Cellular automata cells[] and use in the rest of the program, draw food if that space in fridge is occupied (boolean value or food class) basically if not empty
}
