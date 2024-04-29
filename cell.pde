
// Represents a cell on the board
class Cell{

  int xPos, yPos;
  
  // Fundamentally all cells are dead in the beginning
  boolean alive = false;
  
  // Array to hold all coordinates of neighbour cells
  // Each Cell has exactly 8 neighbours and all of these neighbours got x-y Coordinates
  int[][] positions = new int[8][2];

  Cell(int x, int y){
      
      // Position of a cell (later on it's place in the holding cells array)
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

  int[][] calculateNeighbours(){
    
      // This values represent the neighbours coordinates
      int a=69;
      int b=69;
      
      // Counter which will increment and represents a array position between 0 and 9
      int arrayPosition =0;
      
    // loop over all possible neighbour configurations
    for (int i=xPos-1; i<=xPos+1; i++ ){
      for (int j=yPos-1; j<=yPos+1; j++){
        
        
        // Coordinates of the current cell
        if (i==xPos && j==yPos){
          continue;
        }
        
        
        // a and b now representing the neighbours Coorinates
        a=i;
        b=j;
        
        
        // Check if the cell is at the edge of the field
        // So we must reverse the Coordinate to find it's opposite neighbour
        // Subtract 1 because arrays start from 0
        if (i<0){
          a=config.nXCells-1;
        }
        if (i>config.nXCells){
          a=0;
        }
        if (j<0){
          b=config.nYCells-1;
        }
        if (j>config.nYCells){
          b=0;
        }
        
        //print(a);
        //print(b);
        //println();
        
        // Saving the Coordinates in the position Array
        positions[arrayPosition][0] = a;
        positions[arrayPosition][1] = b;
        arrayPosition++;
      }   
    }  
    return positions;
    
  }

  int getNeighbourTotal(){

    positions = calculateNeighbours();
    return 1;
  }

}


// Function to fill an array with the needed amount of cells
// Amount is defined with the given config values
Cell[][] createCells() {
  

  // Create an empty 2D-Array which is going to hold all cells
  Cell[][] cells = new Cell[config.nXCells][config.nYCells];
  
  
  for (int x=0; x<config.nXCells; x++){   
     for (int y=0; y<config.nYCells; y++){
       
     
       // Create new Cell object
       Cell c = new Cell(x, y); 
       
       // Calculate it's neighbours, this only has to be done once
       c.calculateNeighbours();
       
       // Filling the array
       cells[x][y] = c; 
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
