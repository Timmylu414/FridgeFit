import g4p_controls.*;

ArrayList <Food> foodInFridge = new ArrayList<Food>();
int foodCounter=0;
int n = 4;
float cellSize;
int padding = 50;
color[][] cells = new color[n][n];
int fridgeX = 25;
int fridgeY = 25;

void setup() {
  size(800,650);
  background(100);
  createGUI();
  fill(255);
  rect(fridgeX, fridgeY, fridgeX + 425, fridgeY + 555 );

  
  
  cellSize = (((width-300)-((n+1)*50))/n);
  println(cellSize);
  setFirstGen();
}

void draw() {
  
  
  float y = padding;
  //countFood();
  for (int i=0; i<(n+1); i++) {
    for (int j = 0; j<n; j++) {
      float x = ((j+1)*50) + j*cellSize;
      fill(cells[i][j]); 
      
      square(x,y,cellSize); 
    }
    y += 50 + cellSize;
  }
  
  //Similar to Cellular automata cells[] and use in the rest of the program, draw food if that space in fridge is occupied (boolean value or food class) basically if not empty
}
