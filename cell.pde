
// Represents a cell on the board
class Cell{

    int xPos, yPos;
    
    // Fundamentally all cells are dead in the beginning
    boolean alive = false;

    Cell(int x, int y){
        
        // Position of a cell (later on place in the holding cells array)
        xPos = x;
        yPos = y;
    }

    // Cell is now dead
    void dies(){
        alive = false;
    }

    // Cell is living now
    void comesAlive(){
        alive = true;
    }
    
    // Returns information about the current state of the cell
    boolean isAlive(){
      return alive;
    }
}


// Function to fill an array with the needed amount of cells
// Amount is defined with the given config values
Cell[][] createCells() {
  

  // Create an empty 2D-Array which is going to hold all cells
  Cell[][] cells = new  Cell[config.nXCells][config.nYCells];
  
  
  for (int x=0; x<config.nXCells; x++){   
     for (int y=0; y<config.nYCells; y++){
       
       // Filling the array
       cells[x][y] = new Cell(x, y);      
    }
  }
  
  return cells;
}


void drawLivingCells() {
  
  for (int x=0; x<config.nXCells; x++){   
     for (int y=0; y<config.nYCells; y++){
       
       // If the cell is alive, colorize it
       if (cells[x][y].isAlive()){
                 
        fill(round(random(255)), round(random(255)), round(random(255)));
        rect(x*config.cellWidth, y*config.cellHeight, config.cellWidth, config.cellHeight);
       }  
    }
  }
}

// Revive n random cells
void activateRandomCells(int n){
  for (int i=0; i<n; i++){
  cells[int(random(config.nXCells))][int(random(config.nYCells))].comesAlive();
  }
}
