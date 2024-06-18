
// Represents a cell on the board
class Cell {
  
  // represents the cells x and y coordinates as its attributes
  int xPos, yPos;

  // Fundamentally all cells are dead in the beginning
  boolean alive = false;

  // Array to hold all coordinates of neighbour cells
  // Each Cell has exactly 8 neighbours and all of these neighbours got x-y Coordinates
  int[][] positions = new int[8][2];

  Cell(int x, int y) {
    // Position of a cell (later on it's place in the holding cells array)
    xPos = x;
    yPos = y;
  }

  // Cell is now dead
  void dies() {
    alive = false;
  }

  // Cell is living now
  void comesAlive() {
    alive = true;
  }

  // Returns information about the current state of the cell
  boolean isAlive() {
    return alive;
  }

  int[][] calculateNeighbours() {
    int arrayPosition = 0;

    // loop over all possible neighbour configurations
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        // Skip the current cell
        if (i == 0 && j == 0) continue;

        // Calculate neighbour positions with wrapping
        int a = (xPos + i + config.nXCells) % config.nXCells;
        int b = (yPos + j + config.nYCells) % config.nYCells;

        // Save the coordinates in the position array
        positions[arrayPosition][0] = a;
        positions[arrayPosition][1] = b;
        arrayPosition++;
      }
    }
    return positions;
  }

  // Method to calculate the total of living cells around the cell
  // This makes it easier in the end to apply Conways rules.
  int neighbourTotal(Cell[][] cells) {
    int total = 0;

    // Looping over all coordinates in the cells neighbours array
    for (int[] coordinate : positions) {
      // Extracting the single Coordinates
      int x = coordinate[0];
      int y = coordinate[1];

      // If the cell is alive, add 1 to the total
      if (cells[x][y].isAlive()) {
        total += 1;
      }
    }
    return total;
  }
}

// Function to fill an array with the needed amount of cells
// Amount is defined with the given config values
Cell[][] createCells() {
  // Create an empty 2D-Array which is going to hold all cells
  Cell[][] cells = new Cell[config.nXCells][config.nYCells];

  for (int x = 0; x < config.nXCells; x++) {
    for (int y = 0; y < config.nYCells; y++) {
      // Create new Cell object
      Cell c = new Cell(x, y);

      // Calculate its neighbours, this only has to be done once
      c.calculateNeighbours();

      // Fill the array
      cells[x][y] = c;
    }
  }
  return cells;
}

// Function to draw all living cells
void drawLivingCells() {
  for (int x = 0; x < config.nXCells; x++) {
    for (int y = 0; y < config.nYCells; y++) {
      // If the cell is alive, colorize it
      if (cells[x][y].isAlive()) {
        fill(config.cellColor);
        rect(x * config.cellWidth, y * config.cellHeight, config.cellWidth, config.cellHeight);
      }
    }
  }
}

// Revive n random cells
void activateRandomCells(int n) {

  for (int i = 0; i < n; i++) {
   
    // Generate coordinates of a random cell
    int x = int(random(config.nXCells));
    int y = int(random(config.nYCells));

    // Revive it (also its corresponding partner in the holding copy array)
    cells[x][y].comesAlive();
    cellsCopy[x][y].comesAlive();
  }
}

// After one iteration of the game this function applies the changes back on the original array
// this has to be done to avoid buugs
// you shouldn't change things inside an array while looping over it
void applyCellChanges() {
  // Loop over all cells
  for (int x = 0; x < config.nXCells; x++) {
    for (int y = 0; y < config.nYCells; y++) {
      // Simply adapt the changes
      if (cellsCopy[x][y].isAlive()) {
        cells[x][y].comesAlive();
      } else {
        cells[x][y].dies();
      }
    }
  }
}


// function to kill all cells
void killAllCells() {

  for (int x = 0; x < config.nXCells; x++) {
    for (int y = 0; y < config.nYCells; y++) {

       // kill the original cell and it's corresponding partner
      cells[x][y].dies();
      cellsCopy[x][y].dies();   
    }
  }
}
