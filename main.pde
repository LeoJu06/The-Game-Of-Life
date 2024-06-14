
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
  
  // ***      Here you can try the diferent shapes
  //createGliderGun(19, 19);
  //createGlider(69, 69); 
   //createLightweightSpaceship(50, 50);
   //createBlinker(40, 40);
  // createBeehive(40, 40);
  //createPulsar(40, 40);
   // ***

}

void main() {

  // Andrin will fill this up
  //show_starter_page();
  background(config.backgroundColor);
  
  if (config.showGrid){
    drawGrid();
  }
  applyGameRules();
  drawLivingCells();
  drawGenerationNumber();
  delay(config.speed);

}

void draw(){
  
  if (startGame){
    main();
  }else{
    showStarterPage();
  }
}
