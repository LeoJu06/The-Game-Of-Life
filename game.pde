// Updated applyGameRules function
void applyGameRules() {
  for (int x = 0; x < config.nXCells; x++) {
    for (int y = 0; y < config.nYCells; y++) {
      // Calculate the total of the neighbour cells
      int total = cells[x][y].neighbourTotal(cells);

      if (cells[x][y].isAlive()) {
        if (total < 2 || total > 3) {
          cellsCopy[x][y].dies();
        }
      } else {
        if (total == 3) {
          cellsCopy[x][y].comesAlive();
        }
      }
    }
  }
  applyCellChanges();
  config.nGeneration += 1;
}

// Utility function to wrap around the grid
int wrap(int coord, int max) {
  if (coord < 0) {
    return coord + max;
  }
  return coord % max;
}

// Updated createGlider function with wrapping
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

// Updated createGliderGun function with wrapping
void createGliderGun(int startX, int startY) {
  int[][] gliderGunPattern = {
    {0, 24}, {1, 22}, {1, 24}, {2, 12}, {2, 13}, {2, 20}, {2, 21}, {2, 34}, {2, 35}, 
    {3, 11}, {3, 15}, {3, 20}, {3, 21}, {3, 34}, {3, 35}, {4, 0}, {4, 1}, {4, 10}, {4, 16}, 
    {4, 20}, {4, 21}, {5, 0}, {5, 1}, {5, 10}, {5, 14}, {5, 16}, {5, 17}, {5, 22}, {5, 24}, 
    {6, 10}, {6, 16}, {6, 24}, {7, 11}, {7, 15}, {8, 12}, {8, 13}
  };

  activatePattern(gliderGunPattern, startX, startY);
}

// Updated createSpaceship function with wrapping
void createSpaceship(int startX, int startY) {
  int[][] spaceshipPattern = {
    {0, 1}, {0, 2}, {1, 0}, {2, 0}, {3, 0}, {3, 1}, {3, 2}, {3, 3}, {2, 3}
  };

  activatePattern(spaceshipPattern, startX, startY);
}

// Updated createBlinker function with wrapping
void createBlinker(int startX, int startY) {
  int[][] blinkerPattern = {
    {0, 0},
    {0, 1},
    {0, 2}
  };

  activatePattern(blinkerPattern, startX, startY);
}

// Updated createBlock function with wrapping
void createBlock(int startX, int startY) {
  int[][] blockPattern = {
    {0, 0},
    {0, 1},
    {1, 0},
    {1, 1}
  };

  activatePattern(blockPattern, startX, startY);
}

// Updated createBeehive function with wrapping
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

// Updated createPulsar function with wrapping
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

// Generalized pattern activation with wrapping
void activatePattern(int[][] pattern, int startX, int startY) {
  for (int[] offset : pattern) {
    int x = wrap(startX + offset[0], config.nXCells);
    int y = wrap(startY + offset[1], config.nYCells);
    cells[x][y].comesAlive();
    cellsCopy[x][y].comesAlive();
  }
}

// Activates user-defined patterns with wrapping
void activateUsersPatterns() {
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
  
  for (int i = 0; i < config.numBlinker; i++) {
    createBlinker(int(random(config.nXCells)), int(random(config.nYCells)));
  }
  
  for (int i = 0; i < config.numSpaceship; i++) {
    createSpaceship(int(random(config.nXCells)), int(random(config.nYCells)));
  }
}
