void setFirstGen() {
  cells = new color[n+1][n];
  
  for(int i=0; i<(n+1); i++) {
    for (int j=0; j<n; j++) {
      cells[i][j] = color(100,100,0);
    }
  }
}
