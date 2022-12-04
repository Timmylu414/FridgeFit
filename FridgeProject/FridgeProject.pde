import g4p_controls.*;

int timePassed = 0;
ArrayList <Food> foodInFridge = new ArrayList<Food>();
int foodCounter=0;
int n = 4;
float cellSize;
int padding = 50;
color[][] cells = new color[n][n];
int fridgeX = 25;
int fridgeWidth = 425;
int fridgeHeight = 555;
int fridgeY = 25;
int fridgeXPad = (fridgeWidth/2)/n;
float balance;
Food[][] fud = new Food[n+1][n];
Student ellie = new Student("Ellie", 16,10,20,30);

float healthValue;


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
  text("Ellie's balance:", 525, 150);
  text("$", 525, 175);
  text(ellie.balance, 530, 175);
  ellie.buyGroceries();

  
  createGUI();
  fill(255);
  rect(fridgeX, fridgeY, fridgeWidth, fridgeHeight );
  println(fridgeX, fridgeX + fridgeWidth);

  
  cellSize = ((fridgeWidth/2)/n);
  println(cellSize);
  setFirstGen();
  ellie.buyGroceries();

}

void draw() {
  timePassed += 1;
  println(timePassed);
  
  float y = padding;
  //countFood();
  for (int i=0; i<(n+1); i++) {
    for (int j = 0; j<n; j++) {
      float x = fridgeX + fridgeXPad/2 + (j*(cellSize+fridgeXPad));   
      if (fud[i][j] != null) {
        fill(cells[i][j]); 
      }
      else {
        fill(255);
      }
      
      square(x,y,cellSize); 
    }
    y += 50 + cellSize;
  }
  setNextGen();
  
  //Similar to Cellular automata cells[] and use in the rest of the program, draw food if that space in fridge is occupied (boolean value or food class) basically if not empty
}
