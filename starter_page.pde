// Starter Page for the Menu Buttons //<>//

// Variable for Starter Page
PImage Hintergrundbild;
PFont titelFont;
int i = 0; // Initialisierung der Variable i

int buttonWidth=200, buttonHeight=50;

int buttonX = (config.winWidth - buttonWidth) / 2;
int buttonY = (int)(config.winHeight / 2.5);



void show_starter_page() {
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
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    
    fill(255); // Text color
    textSize(20);
    text("Start Game", buttonX + buttonWidth / 2, buttonY + buttonHeight / 2 + 7); // Adjust the +7 for vertical alignment
    
  
}

void mousePressed() {
    if (mouseX > buttonX && mouseX < buttonX + buttonWidth && mouseY > buttonY && mouseY < buttonY + buttonHeight) {
        // Start the game
        startGame();
    }
}

void startGame() {
    // Your code to start the game goes here
    println("Starting the game...");
   // main();
}
