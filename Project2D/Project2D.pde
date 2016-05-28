
ArrayList planets = new ArrayList();

int orbitRadius = 50;

float starX;
float starY;
float starRadius;

void setup(){
  
  size(640, 640);
  frameRate(20);
  
  starX = width/2;
  starY = height/2;
  
}


void draw(){
  background(0);
  
  Star sun = new Star(400, 100, starX, starY);
  sun.display();
  starRadius = sun.radius;
  
  stroke(255, 255, 255);

  strokeWeight(4);
  line(starX, starY - sun.radius - orbitRadius, mouseX, mouseY);
  noStroke();
  
  for (int i = 0; i < planets.size(); i++){
     Planet planet = (Planet) planets.get(i);
     planet.checkForce(sun);
     //planet.update();
     planet.display();
     if (planet.starCollision(sun)){
       planets.remove(i);
     }
  }
  
}

void mousePressed(){
  // X velocity will be the difference between the mouse location and the star's x location
  float xVelocity = mouseX - starX;
  // Y velocity will be the difference between the mouse location and the planet's initial y location
  // The planet's initial y location will be the star's initial y location minus the orbital radius
  float yVelocity = mouseY - (starY - 100 - orbitRadius);
  planets.add(new Planet(starX, starY - 100 - orbitRadius, xVelocity, yVelocity)); 
}