
// Single config object
// Every other file needs to have access on it
// So make it global
Config config = new Config();

// Global 2D-Array which contains all cells
Cell[][] cells;

// Global 2D-Array which contains copies of the cells
// Changes will first be applied at the copy of cell
Cell[][] cellsCopy;




void setup() {

  println("Start of Programm");

  size(800, 800);

  // create the cells and the copies too
  cells = createCells();
  cellsCopy = createCells();
}

// main function to execute the programm
void main() {

  // redraw the background
  background(config.backgroundColor);

  // possibility to draw the grid (can be chosen by the user)
  if (config.showGrid) {
    drawGrid();
  }
  // apply the game rules and wait after each gen for the next
  // this doesn't have to be done in the first round
  if (!config.firstRound) {

    //update the cells with the given game rules
    applyGameRules();
    delay(config.gameSpeed);
  } else {
    // switch this to false after the first round
    config.firstRound = false;
  }

  // draw the changes on the screen
  drawLivingCells();
  drawGenerationNumber();
  drawBackToMenuButton();
}

// main draw function which is needed in every pde file
void draw() {

  // simple swich logic to handle what page should be seen
  if (startGame) {
    main();
  } else if (showConfigPage) {
    displayConfigPage();
  } else {
    showStarterPage();
  }
}
