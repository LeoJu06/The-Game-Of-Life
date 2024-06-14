

// Config class, contains all necessary configuration values, these won't change
// during execution.

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
  int percentOfLivingCells = 40;
  int amountCells = percentOfLivingCells * nXCells;
  
  int gameSpeed = 0;
}
