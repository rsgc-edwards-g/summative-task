
float starX, starY;
Star sun;
Core core;

void setup() {
  size(640, 640, P3D);
  frameRate(50);
  sphereDetail(25);

  starX = width/2;
  starY = height/2;
  
  sun = new Star(400, 100, starX, starY);
  core = new Core(sun, 50);
}

void draw() {
  background(0);
  //camera(mouseX, mouseY, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);

  
  sun.death();
  core.collapse(sun.radius);
  sun.display();
  core.display();

} 