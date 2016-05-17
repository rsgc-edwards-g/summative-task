

float x, y, z;

void setup() {
  size(200, 200, P3D);
  
}

void draw() {

  background(0);
  translate(100, 100, 0);
  if (mousePressed) {
    //lights();
    spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/2, 4);
  }
  noStroke();
  fill(255);
  sphere(50);
}