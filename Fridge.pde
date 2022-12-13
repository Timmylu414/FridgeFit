class Fridge {

  //FIELDS
  int x; 
  int y;
  int fridgeWidth; 
  int fridgeHeight;
  int fridgeXPad;
  int fridgeYPad;
  int radius;
  ArrayList <Food> food;  
  Food[][] cells;  //2D array as well as array list so that accessing foods can be more efficient in some cases
  float cellX;
  float cellY;
  float pad;
  String size;
  int n;
  int numFoodSpoiled;
  float spoilRate;
  int shoppingFrequency;
  int capacity; 
  Student student;

  //CONSTRUCTOR
  Fridge(int x, int y, int w, int h, int r, float padding, String s, float sR, int sF) {
    this.size = s; 

    //changing number of columns depending on fridge size
    if (this.size == "small") {
      this.n = 3;
    } else if (this.size == "medium") {
      this.n = 4;
    } else if (this.size == "large") {
      this.n = 5;
    }

    this.x = x;
    this.y = y;
    this.fridgeWidth = w;
    this.fridgeHeight = h;
    this.fridgeXPad = (fridgeWidth/2)/n;
    this.fridgeYPad = (fridgeHeight/2)/(n+1);
    this.radius = r;
    this.food = new ArrayList<Food>();
    this.cells = new Food[n+1][n];
    this.cellX = (fridgeWidth/2)/n;
    this.cellY = (fridgeHeight/2)/(n+1);
    this.pad = padding;

    this.numFoodSpoiled = 0;
    this.spoilRate = sR;
    this.shoppingFrequency=sF;
    this.capacity = n*(n+1);
  }

  //METHODS
  void assignStudent(Student s) {  //Assigns an owner to the fridge
    this.student = s;
  }

  void setFirstGen() {  //Fills fridge randomly 
    for (int i=0; i<(n+1); i++) {
      for (int j=0; j<n; j++) {
        if (random(0, 1)>0.1) {
          insertItem(i, j);
        } 
        //If spot is empty, it is set to null
      }
    }
  }

  void setNextGen() {
    removeSpoiled();
    for (Food item : food) {  //going through every food item and updating freshness and then color of each food item
      item.freshness -= item.healthValue*spoilRate;  
      item.updateFoodColor();
    }
    if (food.size()<shoppingFrequency) {  //if below user set value for number of items in fridge, fridge is filled with new groceries
      fillFridge();
    }
  }

  void drawFridge() {  //Draws white rectangle as background for fridge
    fill(255);
    rect(fridgeX, fridgeY, fridgeWidth, fridgeHeight, radius);
    for (int i=1; i < (n+1); i++) {
      if (i%2 == 0) {  
        line(fridgeX+(fridgeXPad/2), fridgeY + (i*(cellY+fridgeYPad)), fridgeX+(fridgeXPad/2) + (n-1)*(cellX + fridgeXPad) + cellX, fridgeY + (i*(cellY+fridgeYPad)));  // calculates where to draw lines representing shelves
      }
    }
  }

  void drawFood() {  //Drawing rectangles in a grid pattern, similar to cellular automata but spaced apart
    for (int i=0; i<(n+1); i++) {
      float y = fridgeY + fridgeYPad/2 + (i*(cellY+fridgeYPad));  
      for (int j = 0; j<n; j++) {
        float x = fridgeX + fridgeXPad/2 + (j*(cellX+fridgeXPad));  
        if (cells[i][j] == null) {  //fills square with white if there is no food in slot
          fill(255);
        } else {
          fill(cells[i][j].foodColor);
        }
        rect(x, y, cellX, cellY);
      }
    }
  }

  void fillFridge() {  
    //filling all empty spots with new food items
    int emptySpots = capacity - food.size();  //calculates how many empty spots are in the fridge
    for (int i=0; i<(n+1); i++) {
      for (int j = 0; j<n; j++) {
        if ((cells[i][j] == null)&&(emptySpots>0)) {
          insertItem(i, j);
          emptySpots--;
        }
      }
    }
  }

  void removeSpoiled() {  //removes food that is spoiled 
    for (int i=food.size()-1; i>=0; i--) {
      Food item = food.get(i);
      if ((item.freshness<0.2)) {  
        removeItem(i);
        numFoodSpoiled++;
      }
    }
  }

  void insertItem(int i, int j) {  //adding new items to fridge slots
    float healthValue = student.healthiness + random(-0.2, 0.2);  //Student Buys health according to their healthiness, with a bit of random chance to represent mood changes
    float freshness = random(0.7, 1);  //freshness varies, as some good might not be as fresh even in the store
    Food item = new Food(healthValue, freshness, i, j);
    cells[i][j] = item;
    food.add(item);
  }

  void removeItem(int i, int j) {  //input 2D array coordinates to remove item from fridge
    cells[i][j] = null;
    for (int k = 0; k < food.size(); k++) {  //Checks coordinates and removes food from array list
      Food item = food.get(k);
      if (item.i == i && item.j == j) {
        food.remove(k);
        break;
      }
    }
  }

  void removeItem(int i) {  //input array list index to remove item from fridge
    Food item = food.get(i);
    cells[item.i][item.j] = null;  //removes food from 2D array 
    food.remove(i);
  }
}
