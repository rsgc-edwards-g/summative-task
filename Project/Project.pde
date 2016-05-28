
float starX, starY;

void setup() {
  size(640, 640, P3D);
  frameRate(100);
  sphereDetail(25);

  starX = 100;
  starY = 100;
}

void draw() {
  background(0);
  camera(mouseX, mouseY, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);
  translate(width/2, height/2, -100);

  Star sun = new Star(400, 100, starX, starY);
  Core core = new Core(sun, 50);
  sun.death();
  core.collapse();
  sun.display();
  core.display();

}