

// Config class, contains all necessary configuration values, these won't change
// during execution.

import g4p_controls.*;

class Config {

  // Define window width and height
  int winWidth = 800;
  int winHeight = 800;

  // Define width and height of a cell
  int cellWidth = 8;
  int cellHeight = 8;

  // Amount of Cells in X and Y direction
  // Like size of the grid or playground
  int nXCells = winWidth / cellWidth;
  int nYCells = winHeight / cellHeight;

  // Amount of start cells on the grid
  int percentOfLivingCells = 30;
  int amountCells = percentOfLivingCells * nXCells;
  
  // decide to draw 
  boolean showGrid = true;
  
  // Set the cell color
  color cellColor = color(249, 255, 74);
  
  // Set the background color
  color backgroundColor = color(59,4,82);
  
  // set the colour for the gen counter
  color generationColour = color(200, 0, 0);
  
  // Counts the number of generations
  int nGeneration = 0;
  
  // 500 means 500 milliseconds of freezing the game after each gen
  int gameSpeed = 500;
  
  
  
  int numGliderGun = 0;
  
  int numGlider = 0;
  
  int numPulsar = 0;
  
  int numBeehive = 0;
 
   int numBlinker = 0;
}
