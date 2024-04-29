
// Single config object
// Every other file needs to have access on it
// So make it global

Config config = new Config();

// Global 2D-Array which contains all cells
Cell[][] cells = createCells();

void setup() {

  //fullScreen();
  size(800, 800);
  
  println("Start of Programm");
  
  // Test calls 
  activateRandomCells(config.amountCells);
  drawLivingCells();

  // Calling the main function
  // Head of the programm
  // Exe
  main();
  
  cells[0][0].calculateNeighbours();
  
  println("End of Programm");
}

void main() {

  // Andrin will fill this up
  //show_starter_page();
  drawGrid();
}
