// Starter Page for the Menu Buttons //<>//

// Variable for Starter Page
PImage Hintergrundbild;
PFont titelFont;
int i = 0; // Initialisierung der Variable i

int StartButtonWidth=200, StartButtonHeight=50;

int StartButtonX = (config.winWidth - StartButtonWidth) / 2;
int StartButtonY = (int)(config.winHeight / 2.5);

int backToMenuButtonWidth = 100;
  int backToMenuButtonHeight = 50;
  int backToMenuButtonX = config.winWidth - backToMenuButtonWidth - 20; // 20 pixels padding from the right edge
  int backToMenuButtonY = config.winHeight - backToMenuButtonHeight - 20; // 20 pixels padding from the bottom edge


boolean startGame = false;
boolean showConfigPage = false;



GTextField numFieldGameSpeed, numPercentLiving, numGliderGun, numGlider, numPulsar, numBeehive, numBlinker, numSpaceship;




void showStarterPage() {
  i = i + 1;
  if (i > 20) {
    i = 0; // Zurücksetzen von i auf 0 bei 20
  }

  Hintergrundbild = loadImage("Images/RetroComputer.jpeg");
  image(Hintergrundbild, 0, 0, config.winWidth, config.winHeight);

  // Load the font
  titelFont = loadFont("Titel.vlw");

  // Set the font and text properties
  textFont(titelFont);
  textSize(45); // Adjust the size as needed
  textAlign(CENTER);

  if (i <= 10) {
    fill(255); // Weiß
  } else {
    fill(0); // Schwarz
  }

  // Draw the title text
  text("Game of Life", config.winWidth / 2, config.winHeight / 3.5);

  // Draw the button
  fill(100); // Button color
  rect(StartButtonX, StartButtonY, StartButtonWidth, StartButtonHeight);

  fill(255); // Text color
  textSize(20);
  text("Start Game", StartButtonX + StartButtonWidth / 2, StartButtonY + StartButtonHeight / 2 + 7); // Adjust the +7 for vertical alignment
  // Event-Handling für die Eingabetaste


  //  text("Eingegebene Zahl: " + numField.getText(), 50, 150);

  // print(numField.getText());
}

void mousePressed() {
  if (mouseX > StartButtonX && mouseX < StartButtonX + StartButtonWidth && mouseY > StartButtonY && mouseY < StartButtonY + StartButtonHeight) {
    // Start the game

    if (showConfigPage) {
      showConfigPage = false;
      startGame = true;
      showConfigTextFields(false);
      setConfigValues();
      activateRandomCells(config.amountCells);
      activateUsersPatterns();
    } else {
      showConfigPage=true;
      placeConfigTextFields();
    }
  }else if(startGame){
    if(mouseX > backToMenuButtonX && mouseX < backToMenuButtonX + backToMenuButtonWidth && mouseY > backToMenuButtonY && mouseY < backToMenuButtonY + backToMenuButtonY){
      
      startGame = false;
      killAllCells();
      config.nGeneration = 0;
      showConfigPage = true;
      showConfigTextFields(true);
      
      config.firstRound = true;
    }
    
    
  }
}

// displays the text
void displayConfigPage() {

  Hintergrundbild = loadImage("Images/RetroComputer.jpeg");
  image(Hintergrundbild, 0, 0, config.winWidth, config.winHeight);

  textSize(16);
  text("Set Game Speed:", 308, 160);


  text("Set % Living:", 300, 180);
  text("Set GliderGun:", 304, 200);
  text("Set Glider:", 290, 220);
  text("Set Pulsar:", 290, 240);
  text("Set Beehive:", 295, 260);
  text("Set Blinker:", 295, 280);


  text("Set Spaceship:", 305, 300);



  // Draw the button
  fill(100); // Button color
  rect(StartButtonX, StartButtonY, StartButtonWidth, StartButtonHeight);

  fill(255); // Text color
  textSize(20);
  text("Start Game", StartButtonX + StartButtonWidth / 2, StartButtonY + StartButtonHeight / 2 + 7); // Adjust the +7 for vertical alignment
  // Event-Handling für die Eingabetaste


  println("showing config setter page");
}





// This function has to be called once and just once
// This makes sure to not overplace each textfield with anotherone
void placeConfigTextFields() {

  numFieldGameSpeed = new GTextField(this, 385, 150, 69, 16);

  numPercentLiving = new GTextField(this, 385, 170, 69, 16);
  numGliderGun = new GTextField(this, 385, 190, 69, 16);
  numGlider = new GTextField(this, 385, 210, 69, 16);
  numPulsar = new GTextField(this, 385, 230, 69, 16);
  numBeehive = new GTextField(this, 385, 250, 69, 16);
  numBlinker = new GTextField(this, 385, 270, 69, 16);
  numSpaceship = new GTextField(this, 385, 290, 69, 16);
}


void setConfigValues() {

  config.gameSpeed = int(numFieldGameSpeed.getText());
  //  println(config.gameSpeed);
  // multiply to convert the number into proper percent
  config.amountCells  = int(numPercentLiving.getText()) * 100;
  println(config.amountCells);

  config.numGliderGun = int(numGliderGun.getText());

  config.numGlider = int(numGlider.getText());


  config.numPulsar = int(numPulsar.getText());

  config.numBeehive = int(numBeehive.getText());

  config.numBlinker = int(numBlinker.getText());
  
  config.numSpaceship = int(numSpaceship.getText());
}

void showConfigTextFields(boolean yeah) {
  numFieldGameSpeed.setVisible(yeah);
  numPercentLiving.setVisible(yeah);
  numGliderGun.setVisible(yeah);
  numGlider.setVisible(yeah);
  numPulsar.setVisible(yeah);
  numBeehive.setVisible(yeah);
  numBlinker.setVisible(yeah);
  numSpaceship.setVisible(yeah);
}



void drawGenerationNumber() {

  textSize(32); // Textgröße festlegen
  fill(config.generationColour);
  text("Gen: " + config.nGeneration, 150, 30);
}


void drawBackToMenuButton() {
  
  
  // Draw the button
  fill(100); // Button color
  rect(backToMenuButtonX, backToMenuButtonY, backToMenuButtonWidth, backToMenuButtonHeight);

  fill(255); // Text color
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Menu", backToMenuButtonX + backToMenuButtonWidth / 2, backToMenuButtonY + backToMenuButtonHeight / 2);
}
