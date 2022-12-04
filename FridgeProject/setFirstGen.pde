void setFirstGen() {
  cells = new color[n+1][n];
  
  for(int i=0; i<(n+1); i++) {
    for (int j=0; j<n; j++) {
      if ((i%2==0)&&(i!=0)) {
        strokeWeight(10);
        //println(i);
        stroke(100);
        line(fridgeX+25, i*(cellSize + padding)+padding/2.0, fridgeX+25 + ((n-1)*50) + n*cellSize, i*(cellSize + padding)+padding/2.0);
        noStroke();
      }
      
      if (random(0,1)>0.1) {
        fud[i][j] = (new Food(10,10,10,"hi", random(2,10)));
        cells[i][j] = color((10/fud[i][j].freshness)*20, (fud[i][j].freshness)*20, 0);
      }
      else {
        fud[i][j] = null;
        cells[i][j] = color(255);
      }
    }
  }
}
