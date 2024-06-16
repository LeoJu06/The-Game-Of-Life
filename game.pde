
void applyGameRules(){
  
  for (int x = 0; x < config.nXCells; x++) {
    for (int y = 0; y < config.nYCells; y++) {
      
       // Calculat the total of the neighbour cells
        int total = cells[x][y].neighbourTotal(cells);

      if (cells[x][y].isAlive()) {
         //println("Cell " + x +" "+ y + " is living (play function)"  );
        
       
        
        if ((total < 2) || (total > 3)){
          cellsCopy[x][y].dies();
        //println("Cell " + x + y + " dies");
        
        } 
      }else{
        
          if (total == 3) {
            cellsCopy[x][y].comesAlive();
            //"Cell " + x + y + " comes alive");
         }
       }
    }
  }
  
  applyCellChanges();
  config.nGeneration+=1;
 // println(config.nGeneration);
}
