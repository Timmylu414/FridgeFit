class Fridge {
  int x; 
  int y;
  int fridgeWidth; 
  int fridgeHeight;
  int fridgeXPad;
  color[][] cells;
  Food[][] food;
  float cellSize;
  float pad;
  int n;


  Fridge(int x, int y, int w, int h, float padding, int n) {
    this.x = x;
    this.y = y;
    this.fridgeWidth = w;
    this.fridgeHeight = h;
    this.fridgeXPad = (fridgeWidth/2)/n; 
    this.cells = new color[n+1][n];
    this.food = new Food[n+1][n];
    this.cellSize = (fridgeWidth/2)/n;
    this.pad = padding;
    this.n = n;
  }

  void setFirstGen() {
    for (int i=0; i<(n+1); i++) {
      for (int j=0; j<n; j++) {
        if ((i%2==0)&&(i!=0)) {
          strokeWeight(10);
          println(i);
          stroke(100);
          line(fridgeX+25, i*(cellSize + padding)+padding/2.0, fridgeX+25 + ((n-1)*50) + n*cellSize, i*(cellSize + padding)+padding/2.0);
          noStroke();
        }

        if (random(0, 1)>0.1) {
          food[i][j] = (new Food(10, 10, 10, "hi", random(2, 10)));
          cells[i][j] = color((10/food[i][j].freshness)*20, (food[i][j].freshness)*20, 0);
        } else {
          food[i][j] = null;
          cells[i][j] = color(255);
        }
      }
    }
  }

  void drawFridge() {
    fill(255);
    rect(fridgeX, fridgeY, fridgeWidth, fridgeHeight);
  }

  void drawFood() {
    float y = pad;
    //countFood();
    for (int i=0; i<(n+1); i++) {
      for (int j = 0; j<n; j++) {
        float x = fridgeX + fridgeXPad/2 + (j*(cellSize+fridgeXPad));   
        if (food[i][j] != null) {
          fill(cells[i][j]);
        } else {
          fill(255);
        }

        square(x, y, cellSize);
      }
      y += 50 + cellSize;
    }
  }
  void removeSpoiled() {
    for (int i=0; i<(n+1); i++) {
      for (int j=0; j<n; j++) {
        if (food[i][j]!= null) {
          if ((food[i][j].freshness<2) && (random(0, 1)>0.8)) {
            food[i][j] = null;
          }
        }
      }
    }
  }
  void setNextGen() {
    removeSpoiled();

    for (int i=0; i<(n+1); i++) {
      for (int j=0; j<n; j++) {
        if (food[i][j] != null) {
          if (timePassed%2 == 0) {
            food[i][j].freshness -= 1;
          }


          cells[i][j] = color((food[i][j].freshness)*20, (food[i][j].freshness)*20, 0);
        }
      }
    }
  }
}
