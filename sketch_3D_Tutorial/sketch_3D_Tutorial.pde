

float x, y, z;

void setup() {
  size(200, 200, P3D);
  
}

void draw() {

  background(0);
  translate(100, 100, 0);
  if (mousePressed) {
    ambientLight(0,0,255);
  }
  noStroke();
  fill(255);
  sphere(50);
}