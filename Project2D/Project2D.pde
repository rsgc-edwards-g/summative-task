
ArrayList planets;

int orbitRadius = 100;

float starX;
float starY;
float starRadius;

void setup(){
  
  size(640, 640);
  frameRate(20);
  
  planets = new ArrayList();
  starX = width/2;
  starY = height/2;
  
}


void draw(){
  background(0);
  
  Star sun = new Star(40000, 100, starX, starY);
  sun.display();
  starRadius = sun.radius;
  
  stroke(255, 255, 255);

  strokeWeight(2);
  line(starX, starY - sun.radius - orbitRadius, mouseX, mouseY);
  noStroke();
  
  for (int i = 0; i < planets.size(); i++){
     Planet planet = (Planet) planets.get(i);
     planet.update(sun);
     if (planet.starCollision(sun)){
       planets.remove(i);
     }
  }
  
}

void mousePressed(){
  // X velocity will be the difference between the mouse location and the star's x location
  float xVelocity = (mouseX - starX)/100;
  // Y velocity will be the difference between the mouse location and the planet's initial y location
  // The planet's initial y location will be the star's initial y location minus the orbital radius
  float yVelocity = (mouseY - (starY - 100 - orbitRadius))/100;
  planets.add(new Planet(starX, starY - 100 - orbitRadius, xVelocity, yVelocity)); 
}