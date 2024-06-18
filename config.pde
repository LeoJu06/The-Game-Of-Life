
// import the needed library
import g4p_controls.*;

// Config class, contains all necessary configuration values
class Config {

  // representing the first round
  boolean firstRound = true;

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

  // decide to draw the grid
  boolean showGrid = true;

  // Set the cell color
  color cellColor = color(249, 255, 74);

  // Set the background color
  color backgroundColor = color(59, 4, 82);

  // set the colour for the gen counter
  color generationColour = color(200, 0, 0);

  // Counts the number of generations
  int nGeneration = 0;

  // 500 means 500 milliseconds of freezing the game after each gen
  int gameSpeed = 0;

  // values to hold the demanded number of patterns from the user
  // the user can change this values during exe.
  int numGliderGun = 0;
  int numGlider = 0;
  int numPulsar = 0;
  int numBeehive = 0;
  int numBlinker = 0;
  int numSpaceship = 0;
}
