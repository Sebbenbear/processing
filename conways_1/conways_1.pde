int size = 2;
int startX = size/2;
int n = 400;
int m = 400;
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
  size(800, 800); // Change the size of the window
  smooth(); // anti-aliasing on the shapes
  background(255, 255, 255); // changes the background
  frameRate(5);
}

void setGreenColour() {
  stroke(67,160,71);
  fill(67,160,71);
}

void setBlackColour() {
  stroke(38,50,56);
  fill(38,50,56);
}

int getNeighbours(int i, int j) {
  
  int neighbours = 0;
  if (i < n-1 && i > 1 && j > 1 && j < m-1) {
    neighbours += cells[i-1][j-1] ? 1:0;
    neighbours += cells[i-1][ j ] ? 1:0;
    neighbours += cells[i-1][j-1] ? 1:0;
    neighbours += cells[ i ][j-1] ? 1:0;
    // skip middle
    neighbours += cells[ i ][j+1] ? 1:0;
    neighbours += cells[i+1][j-1] ? 1:0;
    neighbours += cells[i+1][ j ] ? 1:0;
    neighbours += cells[i+1][j+1] ? 1:0;
  }

  return neighbours;
}

boolean isAlive(int i, int j, boolean[][] cellCopy) {
  int neighbours = getNeighbours(i, j);
  
  if (cellCopy[i][j]) {
    return (neighbours == 2 || neighbours == 3);
  } else { // Otherwise it's dead, and needs 3 neighbours to become alive again
    return neighbours == 3;
  }
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
      cells[i][j] = isAlive(i, j, cellCopy);
      if (cells[i][j]) {
        setGreenColour();
      } else {
        setBlackColour();
      }
      ellipse(x, y, size, size);
      x += size; //+ 3;
    }
    y += size; // + 3;
    x = startX;
    
    // reset the initial cell
  }
}
