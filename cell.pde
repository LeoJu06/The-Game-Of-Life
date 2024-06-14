// Represents a cell on the board
class Cell {

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

    // Simply return the total
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
    //intln("Cell " + i + " of " + n + " was activated");

    // Generate coordinates of a random cell
    int x = int(random(config.nXCells));
    int y = int(random(config.nYCells));

    // Revive it (also its corresponding partner in the holding copy array)
    cells[x][y].comesAlive();
    cellsCopy[x][y].comesAlive();
  }
}

// After one iteration of the game this function applies the changes back on the original array
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


// function to create a glider with the top at position x y
void createGlider(int startX, int startY) {
  // Check if the glider fits within the boundaries of the grid
  if (startX >= 0 && startX + 2 < config.nXCells && startY >= 0 && startY + 2 < config.nYCells) {
    // Define the glider pattern (relative coordinates)
    int[][] gliderPattern = {
      {0, 1},
      {1, 2},
      {2, 0},
      {2, 1},
      {2, 2}
    };

    // Activate the cells to form the glider
    for (int[] offset : gliderPattern) {
      int x = startX + offset[0];
      int y = startY + offset[1];
      cells[x][y].comesAlive();
      cellsCopy[x][y].comesAlive(); // Assuming cellsCopy is used to apply changes
    }
  } else {
    println("The glider cannot be placed at this position.");
  }
}

void createGliderGun(int startX, int startY) {
  // Check if the glider gun fits within the boundaries of the grid
  if (startX >= 0 && startX + 36 < config.nXCells && startY >= 0 && startY + 9 < config.nYCells) {
    // Define the glider gun pattern (relative coordinates)
    int[][] gliderGunPattern = {
      {0, 24}, {1, 22}, {1, 24}, {2, 12}, {2, 13}, {2, 20}, {2, 21}, {2, 34}, {2, 35}, 
      {3, 11}, {3, 15}, {3, 20}, {3, 21}, {3, 34}, {3, 35}, {4, 0}, {4, 1}, {4, 10}, {4, 16}, 
      {4, 20}, {4, 21}, {5, 0}, {5, 1}, {5, 10}, {5, 14}, {5, 16}, {5, 17}, {5, 22}, {5, 24}, 
      {6, 10}, {6, 16}, {6, 24}, {7, 11}, {7, 15}, {8, 12}, {8, 13}
    };

    // Activate the cells to form the glider gun
    for (int[] offset : gliderGunPattern) {
      int x = startX + offset[0];
      int y = startY + offset[1];
      cells[x][y].comesAlive();
      cellsCopy[x][y].comesAlive(); // Assuming cellsCopy is used to apply changes
    }
  } else {
    println("The glider gun cannot be placed at this position.");
  }
}
