void setFirstGen() {
  cells = new color[n][n];
  
  for(int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      cells[i][j] = color(100,100,0);
    }
  }
}
