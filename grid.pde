


void drawGrid() {

  for (int x = 0; x < config.winWidth; x+=config.cellWidth) {
    line(x, 0, x, config.winHeight);
  }

  for (int y = 0; y < config.winHeight; y+=config.cellHeight) {
    line(0, y, config.winWidth, y);
  }
}
