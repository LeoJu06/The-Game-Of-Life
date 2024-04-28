
Config config = new Config();

// test object for further tests
//Cell c1 = new Cell(0, 0);
Cell[][] cells = createCells();





void setup() {

  //fullScreen();
  size(800, 800);
  
  println("Start of Programm");
  
  // Test calls below 
  activateRandomCells(69);
  drawLivingCells();
  
  main();
  

  println("End of Programm");
}

void main() {
 
  //show_starter_page();
  drawGrid();
}
