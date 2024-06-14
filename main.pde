
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
  
  //createGliderGun(19, 19);
  //createGlider(69, 69);

}

void main() {


 // show_starter_page();
  background(255);
  drawGrid();
  play();
  drawLivingCells();
  
  // Setting th game speed, wait after each iteration
  delay(config.gameSpeed);

}

void draw(){
  main();
}
