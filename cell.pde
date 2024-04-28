

class Cell{

    int xPos, yPos;
    boolean alive = false;

    Cell(int x, int y){
        
        xPos = x;
        yPos = y;
    }

    void dies(){
        alive = false;
    }

    void comesAlive(){
        alive = true;
    }
    
    boolean isAlive(){
      return alive;
    }

}

Cell[][] createCells() {
  

  
  Cell[][] cells = new  Cell[config.nXCells][config.nYCells];
  
  for (int x=0; x<config.nXCells; x++){   
     for (int y=0; y<config.nYCells; y++){
       
       cells[x][y] = new Cell(x, y);      
    }
  }
  
  return cells;
}


void drawLivingCells() {
  
  for (int x=0; x<config.nXCells; x++){   
     for (int y=0; y<config.nYCells; y++){
       
       if (cells[x][y].isAlive()){
         
         fill(33, 33, 33);
        rect(x*config.cellWidth, y*config.cellHeight, config.cellWidth, config.cellHeight);
       }  
    }
  }
}


void activateRandomCells(int n){
  for (int i=0; i<n; i++){
  cells[round(random(config.nXCells))][round(random(config.nYCells))].comesAlive();
  }
}
