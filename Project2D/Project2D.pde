// Use an array list to keep track of the planets since it is more agile than an array
ArrayList planets = new ArrayList();
// Set an initial launch height above the core (not the surface)
int launchHeight = 140;

// Create the star that will be used
Star sun;

// Create the variables that contain the star's location
float starX;
float starY;

void setup() {
  // Set the size of the window and the animation speed
  size(640, 640);
  frameRate(80);

  // Make sure the star is in the center of the screen
  starX = width/2;
  starY = height/2;

  // Create the star here so it isn't created over and over 
  sun = new Star(400, 100, starX, starY);
}


void draw() {
  // Set the background colour to black to mimic space
  background(0);
  // Write down the commands the user can use in the upper left corner of the window
  text("Commands", 10, 10);
  text("u - launch height up", 10, 25);
  text("d - launch height down", 10, 40);
  text("c - clear planets", 10, 55);

  // Draw the sun
  sun.display();

  // Draw the line that shows users relative initial velocity and launch angle in white
  stroke(255, 255, 255);
  strokeWeight(2);
  line(starX, starY - launchHeight, mouseX, mouseY);
  noStroke();

  // For each planet in the array list, determine its acceleration, change its velocity and location and then make sure it doesn't hit the sun
  for (int i = 0; i < planets.size(); i++) {
    Planet planet = (Planet) planets.get(i);
    planet.checkForce(sun);
    planet.update();
    // if the planet does hit the sun, get rid of it
    if (planet.starCollision(sun)) {
      planets.remove(i);
    }
  }
}

/*
When a user clicks somewhere, they determine the direction and speed of a planet they are sending into orbit around the sun. 
 The line drawn in the window tells them where they are launching it and how fast it will go.
 */
void mousePressed() {
  // X velocity will be the difference between the mouse location and the star's x location
  float xVelocity = (mouseX - starX)/100;
  // Y velocity will be the difference between the mouse location and the planet's initial y location
  // The planet's initial y location will be the star's initial y location minus the orbital radius
  float yVelocity = (mouseY - (starY - launchHeight))/100;
  planets.add(new Planet(starX, starY - launchHeight, xVelocity, yVelocity));
}

/*
If a user clicks one of the "special" buttons, they can change the launch height 
(and location as a result) as well as clear the screen of all planets in orbit.
 */
void keyPressed() {

  // There is a maximum and minimum launch height. Planets can be launched from 5 to 100 units above the surface of the sun.
  if (key == 'u' && launchHeight < 200) {
    // If a user clicks the 'u' key, they increase the launch height
    launchHeight++;
  } else if (key == 'd' && launchHeight > 105) {
    // If a user hits the 'd' key, they decrease the launch height
    launchHeight--;
  } else if (key == 'c') {
    // If a user hits the 'c' key, they delete all the planets in orbit
    for (int i = 0; i < planets.size(); i++) {
      planets.remove(i);
    }
  }
}