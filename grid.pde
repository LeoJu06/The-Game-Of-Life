
void drawGrid() {
  int numCols = config.winWidth / config.cellWidth;
  int numRows = config.winHeight / config.cellHeight;

  // draw vertical line
  for (int col = 0; col <= numCols; col++) {
    int x = col * config.cellWidth;
    line(x, 0, x, config.winHeight);
  }

  // draw horizontal lines
  for (int row = 0; row <= numRows; row++) {
    int y = row * config.cellHeight;
    line(0, y, config.winWidth, y);
  }
}
