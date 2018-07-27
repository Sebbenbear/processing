int size = 40;
int startX = size/2;
int n = 10;
int m = 10;
boolean[][] cells = initialiseCells();

boolean[][] initialiseCells() {
  boolean[][] cells = new boolean[n][m];
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      cells[i][j] = getRandomSeedValue();
    }
  }
  return cells;
}

boolean getRandomSeedValue() {
  return (int(random(0, 2) % 2) == 1);
}

void setup() {
  size(500, 500); // Change the size of the window
  smooth(); // anti-aliasing on the shapes
  background(230, 230, 230); // changes the background
  frameRate(10);
}

void setGreenColour() {
  stroke(67,160,71);
  fill(67,160,71);
}

void setBlackColour() {
  stroke(55,71,79);
  fill(55,71,79);
}

boolean isAlive(int i, int j) {
  return !cells[i][j];
}
 
void draw() {
  // create a copy for the reference
  boolean [][] cellCopy = new boolean[n][m];
  
  for(int i = 0; i < n; i++) {
    cellCopy[i] = cells[i].clone();
  }

  float x = startX;
  float y = 0 + size/2;
  
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      cellCopy[i][j] = isAlive(i, j);
      if (cellCopy[i][j]) {
        setGreenColour();
      } else {
        setBlackColour();
      }
      ellipse(x, y, size, size);
      x += size + 3;
    }
    y += size + 3;
    x = startX;
    
    // reset the initial cells
    cells = cellCopy;
  }
}
