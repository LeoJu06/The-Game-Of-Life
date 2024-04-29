
void play(){
  
  for (int x = 0; x < config.nXCells; x++) {
    for (int y = 0; y < config.nYCells; y++) {

      if (cells[x][y].isAlive()) {
        
        int total = cells[x][y].neighbourTotal(cells);
        
        if ((total < 2) || (total > 3)){
          cells[x][y].dies();
        } else {
          // Wenn die Zelle lebt oder neu geboren wird, wird sie markiert
          // Hier sollte die Bedingung stehen, unabhängig davon, ob die Zelle bereits lebt
          if (total == 3) {
            cells[x][y].comesAlive();
          }
        }
      }
    }
  }
}
