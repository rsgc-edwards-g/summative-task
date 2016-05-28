
ArrayList planets;

int orbitRadius = 140;

float starX;
float starY;

void setup() {

  size(640, 640);
  frameRate(80);

  planets = new ArrayList();
  starX = width/2;
  starY = height/2;
}


void draw() {
  background(0);
  text("Commands", 10, 10);
  text("u - launch height up", 10, 25);
  text("d - launch height down", 10, 40);
  text("c - clear planets", 10, 55);

  Star sun = new Star(400, 100, starX, starY);
  sun.display();

  stroke(255, 255, 255);

  strokeWeight(2);
  line(starX, starY - orbitRadius, mouseX, mouseY);
  noStroke();

  for (int i = 0; i < planets.size(); i++) {
    Planet planet = (Planet) planets.get(i);
    planet.checkForce(sun);
    planet.update();
    if (planet.starCollision(sun)) {
      planets.remove(i);
    }
  }
}

void mousePressed() {
  // X velocity will be the difference between the mouse location and the star's x location
  float xVelocity = (mouseX - starX)/100;
  // Y velocity will be the difference between the mouse location and the planet's initial y location
  // The planet's initial y location will be the star's initial y location minus the orbital radius
  float yVelocity = (mouseY - (starY - orbitRadius))/100;
  planets.add(new Planet(starX, starY - orbitRadius, xVelocity, yVelocity));
}

void keyPressed() {

  if (key == 'u' && orbitRadius < 200) {
    orbitRadius++;
  } else if (key == 'd' && orbitRadius > 105) {
    orbitRadius--;
  } else if (key == 'c') {
    for (int i = planets.size()-1; i >= 0; i--) {
      planets.remove(i);
    }
  }
}