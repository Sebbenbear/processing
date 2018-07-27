float size = 40;
float startX = size/2;
float n = 10;
float m = 10;

void setup() {
  size(500, 500); // Change the size of the window
  smooth(); // anti-aliasing on the shapes
  background(230, 230, 230); // changes the background
  frameRate(5);
}

boolean isAlive() {
  return (int(random(0, 2) % 2) == 1);
}

void setGreenColour() {
  stroke(67,160,71);
  fill(67,160,71);
}

void setBlackColour() {
  stroke(55,71,79);
  fill(55,71,79);
}
 
void draw() {
  float x = startX;
  float y = 0 + size/2;
  for (float i = 0; i < n; i++) {
    for (float j = 0; j < m; j++) {
      if (isAlive()) {
        setGreenColour();
      } else {
        setBlackColour();
      }
      ellipse(x, y, size, size);
      x += size + 3;
    }
    y += size + 3;
    x = startX;
  }
}
