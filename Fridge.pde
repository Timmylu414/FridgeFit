class Fridge {
  int x; 
  int y;
  int fridgeWidth; 
  int fridgeHeight;
  int fridgeXPad;
  Food[][] cells;
  float cellSize;
  ArrayList <Food> food;
  float pad;
  int n;
  int numFoodSpoiled;
  float spoilRate;
  int capacity; 
  Student student;

  Fridge(int x, int y, int w, int h, float padding, int n) {
    this.x = x;
    this.y = y;
    this.fridgeWidth = w;
    this.fridgeHeight = h;
    this.fridgeXPad = (fridgeWidth/2)/n; 
    this.cells = new Food[n+1][n];
    this.cellSize = (fridgeWidth/2)/n;
    this.food = new ArrayList<Food>();
    this.pad = padding;
    this.n = n;
    this.numFoodSpoiled = 0;
    this.spoilRate = 0.1;
    this.capacity = n*(n+1);
  }
  
  void assignStudent(Student s) { 
    this.student = s;
  }

  void insertItem(int i, int j) {
    float healthValue = random(0, 1);
    float freshness = random(0.7, 1);
    Food item = new Food(healthValue, random(0, 1), 10, "hi", freshness, i, j);
    cells[i][j] = item;
    food.add(item);
  }

  void removeItem(int i, int j) {
    cells[i][j] = null;
    for (int k = 0; k < food.size(); k++) {
      Food item = food.get(k);
      if (item.i == i && item.j == j) {
        food.remove(k);
        break;
      }
    }
  }
  
  void removeItem(int i) {
    Food item = food.get(i);
    cells[item.i][item.j] = null;
    food.remove(i);
  }

  void setFirstGen() {
    for (int i=0; i<(n+1); i++) {
      for (int j=0; j<n; j++) {
        if (random(0, 1)>0.1) {
          insertItem(i, j);
        } else {
          cells[i][j] = null;
        }
      }
    }
  }

  void drawFridge() {
    fill(255);
    rect(fridgeX, fridgeY, fridgeWidth, fridgeHeight);
    strokeWeight(10);
    stroke(100);
    line(fridgeX+25, 2*(cellSize + padding)+padding/2.0, fridgeX+25 + ((n-1)*50) + n*cellSize, 2*(cellSize + padding)+padding/2.0);
    line(fridgeX+25, 4*(cellSize + padding)+padding/2.0, fridgeX+25 + ((n-1)*50) + n*cellSize, 4*(cellSize + padding)+padding/2.0);
    noStroke();
  }

  void drawFood() {
    float y = pad;
    //countFood();

    for (int i=0; i<(n+1); i++) {
      for (int j = 0; j<n; j++) {
        float x = fridgeX + fridgeXPad/2 + (j*(cellSize+fridgeXPad));  
        if (cells[i][j] == null) {
          fill(255);
        } else {
          fill(cells[i][j].foodColor);
        }
        square(x, y, cellSize);
      }
      y += 50 + cellSize;
    }
  }
  void removeSpoiled() {
    for (int i=food.size()-1; i>=0; i--) {
      Food item = food.get(i);
      if ((item.freshness<0.2) && (random(0, 1)>0.8)) {
        food.remove(i);
        numFoodSpoiled++;
      }
    }
  }
  void setNextGen() {
    removeSpoiled();
    for (Food item : food) {
      item.freshness -= item.healthValue*spoilRate;
      item.updateFoodColor();
    }
  }

  void drawSpoiledFoodCounter(int x, int y) {
    String text = ("Spoiled food thrown out :" + numFoodSpoiled);
    fill(255);
    text(text, x, y);
  }

  void eatFood(int n, float hV, float fV) {
    for (int i=food.size()-1; i>=0; i--) {
      Food item = food.get(i);
      if (n == 0) {
        break;
      }
      if ((item.healthValue >= hV)) {
        student.foodEaten++;
        student.health = student.health + round((item.healthValue - 0.5)*10) - round((1-item.freshness)*5);
        removeItem(i);
        n--;
      }
    }
  }
  
  void fillFridge() {
    int emptySpots = capacity - food.size();
    //Loop through cells 
    //if that cell is null, call insertItem(i,j)
    //want to adjust insertItem to depend on student's healthiness etc. 
  }

}
