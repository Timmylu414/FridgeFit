import g4p_controls.*;

ArrayList <Food> foodInFridge = new ArrayList<Food>();
int foodCounter=0;
int n = 3;
float cellSize;
int padding = 50;
color[][] cells = new color[n][n];

void setup() {
  size(500,650);
  createGUI();
  
  cellSize = ((width-((n+1)*50))/n);
  println(cellSize);
  setFirstGen();
}

void draw() {
  background(100);
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
  
  //12/1/22, Draw a screen with spaced boxes for food, with different coloring (random for now)
  //Similar to Cellular automata cells[] and use in the rest of the program, draw food if that space in fridge is occupied (boolean value or food class) basically if not empty
}
