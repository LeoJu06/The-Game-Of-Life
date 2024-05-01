
void play(){
  
  for (int x = 0; x < config.nXCells; x++) {
    for (int y = 0; y < config.nYCells; y++) {

      if (cells[x][y].isAlive()) {
         //println("Cell " + x +" "+ y + " is living (play function)"  );
        
        int total = cells[x][y].neighbourTotal(cells);
        
        if ((total < 2) || (total > 3)){
          cellsCopy[x][y].dies();
          println("Cell " + x + y + " dies");
          
          //delay(5000);
        } else {
        
          if (total == 3) {
            cellsCopy[x][y].comesAlive();
            println("Cell " + x + y + " comes alive");
          }
        }
      }
    }
  }
  
  applyCellChanges();
}
