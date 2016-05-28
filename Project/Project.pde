
float starMass = (float) (1.989 * pow(10,30));
float earthMass = (float) (5.972 * pow(10, 24));
  
Star sun = new Star(starMass, 700000.0, 0, 0);
Planet earth = new Planet(earthMass, 73000.0, 0.0, 200.0);

void setup() {
  size(640, 640, P3D);
  
}

void draw() {
  background(0);
  camera(mouseX, mouseY, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);
  translate(width/2, height/2, -100);
  stroke(255);
  //noFill();
  
  sun.display();
  
  earth.checkForce(sun);
  earth.update();
  earth.display();
  
}