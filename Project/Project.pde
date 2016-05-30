// Initialize variables for star coordinates, the star being used and its core
float starX, starY;
Star sun;
Core sunCore;

void setup() {
  // Set the dimensions and make sure the animation occurs in 3D
  size(640, 640, P3D);
  // Set the animating speed and quality using these functions
  frameRate(25);
  // Set the sphere detail moderately low so that you can still see the core
  sphereDetail(40);

  // Define the star's location to be in the middle of the screen
  starX = width/2;
  starY = height/2;
  
  // Create the sun and core here so that their radii and masses will change as the simulation progresses
  sun = new Star(400, 100, starX, starY);
  sunCore = new Core(sun);
}

void draw() {
  // Set the background to black to mimic space
  background(0);
  // Give user's the ability to look at the star from different angles
  camera(mouseX, mouseY, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);

  // Animate the sun's death using the star.death function and the core.collapse function
  sun.death();
  sunCore.collapse(sun.radius);
  // Draw the sun as well as its core
  sun.display();
  sunCore.display();

} 