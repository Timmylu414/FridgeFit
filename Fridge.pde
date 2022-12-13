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
  ArrayList <Food> freshFood;
  Food[][] cells;
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
    if (this.size == "small") {
      this.n = 3;
    }

    else if (this.size == "medium") {
      this.n = 4;
    }

    else if (this.size == "large") {
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
    this.freshFood = new ArrayList<Food>();
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

  void insertItem(int i, int j) {  //Shopping
    float healthValue = student.healthiness + random(-0.2, 0.2);  //Student Buys health according
    float freshness = random(0.7, 1);
    Food item = new Food(healthValue, random(0, 1), "hi", freshness, i, j);
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

  void setFirstGen() {  //Fills fridge randomly 
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
    rect(fridgeX, fridgeY, fridgeWidth, fridgeHeight, radius);
    strokeWeight(10);
    stroke(100);
    for (int i=1; i < (n+1); i++) {
      if (i%2 == 0) {
        line(fridgeX+(fridgeXPad/2), fridgeY + (i*(cellY+fridgeYPad)), fridgeX+(fridgeXPad/2) + (n-1)*(cellX + fridgeXPad) + cellX, fridgeY + (i*(cellY+fridgeYPad)));
      }
    }
    noStroke();
  }

  void drawFood() {
    //countFood();

    for (int i=0; i<(n+1); i++) {
      float y = fridgeY + fridgeYPad/2 + (i*(cellY+fridgeYPad));
      for (int j = 0; j<n; j++) {
        float x = fridgeX + fridgeXPad/2 + (j*(cellX+fridgeXPad));  
        if (cells[i][j] == null) {
          fill(255);
        } else {
          fill(cells[i][j].foodColor);
        }
        rect(x, y, cellX, cellY);
      }
    }
  }

  void removeSpoiled() {
    for (int i=food.size()-1; i>=0; i--) {
      Food item = food.get(i);
      if ((item.freshness<0.2)) {
        removeItem(i);
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
    if (food.size()<shoppingFrequency) {
      fillFridge();
    }
  }

  //int countFresh() {
  //  int numFresh;
  //  for (Food f : food) {
  //    if (f.freshness<0.2) {
  //      freshFood.add(f);
  //    }
  //  }
  //  return(freshFood.size());
  //}

  void drawSpoiledFoodCounter(int x, int y) {
    String text = ("Spoiled food thrown out :" + numFoodSpoiled);
    fill(255);
    text(text, x, y);
  }



  void fillFridge() {
    int emptySpots = capacity - food.size();
    for (int i=0; i<(n+1); i++) {
      for (int j = 0; j<n; j++) {
        if ((cells[i][j] == null)&&(emptySpots>0)) {
          insertItem(i, j);
          emptySpots--;
        }
        //want to adjust insertItem to depend on student's healthiness etc.
      }
    }
  }
}
