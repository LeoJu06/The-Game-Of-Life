
// Function to apply conways rules of the of life
void applyGameRules() {

  // loop over all cells
  for (int x = 0; x < config.nXCells; x++) {
    for (int y = 0; y < config.nYCells; y++) {

      // Calculate the total of the neighbour cells
      int total = cells[x][y].neighbourTotal(cells);

      // if the cell is alive and has less than 2 or more than 3 neighbours it dies.
      if (cells[x][y].isAlive()) {
        if (total < 2 || total > 3) {
          cellsCopy[x][y].dies();

          // the logic also holds the fourth rule
          // it stays on if it has either 2 or 3 neighbours that are on
        }

        //
      } else {
        // if the cell has exactly 3 neighbours is comes alivve
        if (total == 3) {
          cellsCopy[x][y].comesAlive();
        }
      }
    }
  }
  // after changing the copy reapply them on the original cells
  applyCellChanges();

  // counting the generation number
  config.nGeneration += 1;
}

// Activate the pattern, which are demanded by the user
void activateUsersPatterns() {
  // loop over the config value and just call the needed creation function

  for (int i = 0; i < config.numGliderGun; i++) {
    createGliderGun(int(random(config.nXCells)), int(random(config.nYCells)));
  }

  for (int i = 0; i < config.numGlider; i++) {
    createGlider(int(random(config.nXCells)), int(random(config.nYCells)));
  }

  for (int i = 0; i < config.numPulsar; i++) {
    createPulsar(int(random(config.nXCells)), int(random(config.nYCells)));
  }

  for (int i = 0; i < config.numBeehive; i++) {
    createBeehive(int(random(config.nXCells)), int(random(config.nYCells)));
  }

  for (int i = 0; i < config.numAcorn; i++) {
    createAcorn(int(random(config.nXCells)), int(random(config.nYCells)));
  }

  for (int i = 0; i < config.numSpaceship; i++) {
    createSpaceship(int(random(config.nXCells)), int(random(config.nYCells)));
  }
}

// Utility function to wrap around the grid
int wrap(int coord, int max) {
  // if coord is negative, it is increased by the value of max,
  // to bring the coordinate into the valid range.
  if (coord < 0) {
    return coord + max;
  }
  // Otherwise, coord modulo max is taken,
  // to ensure that it remains within the range from 0 to max-1
  return coord % max;
}

// ****

// All of the following are functions to create certain elements of the game of life
// The logic stays allways the same
// Each function takes x and y coords as its input
// each function holds hard coded coords, this cords have to be activated to create the element
// the activate pattern function is called each time

// ****


void createGlider(int startX, int startY) {
  int[][] gliderPattern = {
    {0, 1},
    {1, 2},
    {2, 0},
    {2, 1},
    {2, 2}
  };
  activatePattern(gliderPattern, startX, startY);
}

void createGliderGun(int startX, int startY) {
  int[][] gliderGunPattern = {
    {0, 24}, {1, 22}, {1, 24}, {2, 12}, {2, 13}, {2, 20}, {2, 21}, {2, 34}, {2, 35},
    {3, 11}, {3, 15}, {3, 20}, {3, 21}, {3, 34}, {3, 35}, {4, 0}, {4, 1}, {4, 10}, {4, 16},
    {4, 20}, {4, 21}, {5, 0}, {5, 1}, {5, 10}, {5, 14}, {5, 16}, {5, 17}, {5, 22}, {5, 24},
    {6, 10}, {6, 16}, {6, 24}, {7, 11}, {7, 15}, {8, 12}, {8, 13}
  };
  activatePattern(gliderGunPattern, startX, startY);
}

void createSpaceship(int startX, int startY) {
  int[][] spaceshipPattern = {
    {0, 1}, {0, 2}, {1, 0}, {2, 0}, {3, 0}, {3, 1}, {3, 2}, {3, 3}, {2, 3}
  };
  activatePattern(spaceshipPattern, startX, startY);
}

void createBlinker(int startX, int startY) {
  int[][] blinkerPattern = {
    {0, 0},
    {0, 1},
    {0, 2}
  };
  activatePattern(blinkerPattern, startX, startY);
}

void createBlock(int startX, int startY) {
  int[][] blockPattern = {
    {0, 0},
    {0, 1},
    {1, 0},
    {1, 1}
  };
  activatePattern(blockPattern, startX, startY);
}

void createBeehive(int startX, int startY) {
  int[][] beehivePattern = {
    {0, 1},
    {0, 2},
    {1, 0},
    {1, 3},
    {2, 1},
    {2, 2}
  };
  activatePattern(beehivePattern, startX, startY);
}

void createPulsar(int startX, int startY) {
  int[][] pulsarPattern = {
    {0, 2}, {0, 3}, {0, 4}, {0, 8}, {0, 9}, {0, 10},
    {2, 0}, {2, 5}, {2, 7}, {2, 12},
    {3, 0}, {3, 5}, {3, 7}, {3, 12},
    {4, 0}, {4, 5}, {4, 7}, {4, 12},
    {5, 2}, {5, 3}, {5, 4}, {5, 8}, {5, 9}, {5, 10},
    {7, 2}, {7, 3}, {7, 4}, {7, 8}, {7, 9}, {7, 10},
    {8, 0}, {8, 5}, {8, 7}, {8, 12},
    {9, 0}, {9, 5}, {9, 7}, {9, 12},
    {10, 0}, {10, 5}, {10, 7}, {10, 12},
    {12, 2}, {12, 3}, {12, 4}, {12, 8}, {12, 9}, {12, 10}
  };
  activatePattern(pulsarPattern, startX, startY);
}

void createAcorn(int startX, int startY) {
  int[][] acornPattern = {
    {0, 1},
    {1, 3}, {1, 4}, {1, 5}, {1, 6},
    {1, 0},
    {2, 2}
  };
  activatePattern(acornPattern, startX, startY);
}


// Generalized pattern activation with wrapping
void activatePattern(int[][] pattern, int startX, int startY) {
  for (int[] offset : pattern) {

    // calculate the coordinate using wrap around logic
    int x = wrap(startX + offset[0], config.nXCells);
    int y = wrap(startY + offset[1], config.nYCells);

    // activate the cell and its corresponding partner
    cells[x][y].comesAlive();
    cellsCopy[x][y].comesAlive();
  }
}
