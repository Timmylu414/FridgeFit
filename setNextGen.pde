
void setNextGen() {
  ellie.removeSpoiled();
   
  for(int i=0; i<(n+1); i++) {
    for (int j=0; j<n; j++) {
      if (fud[i][j] != null) {
        fud[i][j].freshness -= 1;
        
        
        cells[i][j] = color((fud[i][j].freshness)*20, (fud[i][j].freshness)*20, 0);  
      }
    }
   }
  
}
