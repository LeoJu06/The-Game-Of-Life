
void applyGameRules(){
  
  for (int x = 0; x < config.nXCells; x++) {
    for (int y = 0; y < config.nYCells; y++) {
      
       // Calculate the total of the neighbour cells
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

// function to create a glider with the top at position x y
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
    activatePattern(gliderGunPattern, startX, startY);
  } else {
    println("The glider gun cannot be placed at this position.");
  }
}

// could be used as some kind of a virus
void createLightweightSpaceship(int startX, int startY) {
  // Check if the spaceship fits within the boundaries of the grid
  if (startX >= 0 && startX + 4 < config.nXCells && startY >= 0 && startY + 4 < config.nYCells) {
    // Define the Lightweight Spaceship pattern (relative coordinates)
    int[][] spaceshipPattern = {
      {0, 1}, {0, 2}, {1, 0}, {2, 0}, {3, 0}, {3, 1}, {3, 2}, {3, 3}, {2, 3}
    };

    // Activate the cells to form the Lightweight Spaceship
    for (int[] offset : spaceshipPattern) {
      int x = startX + offset[0];
      int y = startY + offset[1];
      cells[x][y].comesAlive();
      cellsCopy[x][y].comesAlive(); // Assuming cellsCopy is used to apply changes
    }
  } else {
    println("The Lightweight Spaceship cannot be placed at this position.");
  }
}
void activatePattern(int[][] pattern, int startX, int startY) {
  for (int[] offset : pattern) {
    int x = startX + offset[0];
    int y = startY + offset[1];
    cells[x][y].comesAlive();
    cellsCopy[x][y].comesAlive(); // Assuming cellsCopy is used to apply changes
  }
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
  // Check if the pulsar fits within the boundaries of the grid
  if (startX >= 0 && startX + 15 < config.nXCells && startY >= 0 && startY + 15 < config.nYCells) {
    // Define the pulsar pattern (relative coordinates)
    int[][] pulsarPattern = {
      // First set of cells
      {0, 2}, {0, 3}, {0, 4}, {0, 8}, {0, 9}, {0, 10},
      // Second set of cells
      {2, 0}, {2, 5}, {2, 7}, {2, 12},
      // Third set of cells
      {3, 0}, {3, 5}, {3, 7}, {3, 12},
      // Fourth set of cells
      {4, 0}, {4, 5}, {4, 7}, {4, 12},
      // Fifth set of cells
      {5, 2}, {5, 3}, {5, 4}, {5, 8}, {5, 9}, {5, 10},
      // Sixth set of cells
      {7, 2}, {7, 3}, {7, 4}, {7, 8}, {7, 9}, {7, 10},
      // Seventh set of cells
      {8, 0}, {8, 5}, {8, 7}, {8, 12},
      // Eighth set of cells
      {9, 0}, {9, 5}, {9, 7}, {9, 12},
      // Ninth set of cells
      {10, 0}, {10, 5}, {10, 7}, {10, 12},
      // Tenth set of cells
      {12, 2}, {12, 3}, {12, 4}, {12, 8}, {12, 9}, {12, 10}
    };

    // Activate the cells to form the pulsar
    activatePattern(pulsarPattern, startX, startY);
  } else {
    println("The pulsar cannot be placed at this position.");
  }
}


void activateUsersPatterns(){
  for (int i=0; i<config.numGliderGun; i++){
    
    createGliderGun(int(random(config.nXCells)), int(random(config.nYCells)));
  }
  
  for (int i=0; i<config.numGlider; i++){
    
    createGlider(int(random(config.nXCells)), int(random(config.nYCells)));
  }
  
  for (int i=0; i<config.numPulsar; i++){
    
    createPulsar(int(random(config.nXCells)), int(random(config.nYCells)));
  }
}
