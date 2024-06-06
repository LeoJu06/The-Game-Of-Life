
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

  // fullScreen();
  size(800, 800);
  
  cells = createCells();
  cellsCopy = createCells();
  
  activateRandomCells(config.amountCells);


  // -----
  // Test calls 
  //println(cells[0][0].neighbourTotal(cells));
  //drawLivingCells();

  // Calling the main function
  // Head of the programm
  // Exe
  //main();

  //cells[0][0].calculateNeighbours();
  // -----

  //println("End of Programm");
}

void main() {

  // Andrin will fill this up
  //show_starter_page();
  background(255);
  drawGrid();
  play();
  drawLivingCells();
  delay(500);
}

void draw(){
  main();
}
