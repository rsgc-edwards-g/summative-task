

float x, y, z;

int concentration = 600; // Try values 1 -> 10000

void setup() {
  size(640, 360, P3D);
}

void draw() {
  background(0);
  camera(mouseX, mouseY, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);
  translate(width/2, height/2, -100);
  stroke(255);
  noFill();
  box(100);
}