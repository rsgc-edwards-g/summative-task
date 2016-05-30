class Planet extends Celestial {

  // Since planets orbit, they need velocity and acceleration vectors
  CVector velocity, acceleration;

  // To create a planet, you need a location and a velocity
  Planet(float xLocation, float yLocation, float xVelocity, float yVelocity) {
    // Planets have negligible mass for calculations and will each have a uniform size
    super(1.0, 5.0, xLocation, yLocation); 
    
    // Set the velocity vector
    velocity = new CVector(xVelocity, yVelocity);
    // Instantiate the acceleration CVector so it can be altered later
    acceleration = new CVector(0.0, 0.0);
  }

  void update() {
    // Update the planet's location and velocity
    velocity.add(acceleration);
    location.add(velocity);

    // Draw the planet
    fill(225, 225, 225);
    display();
  }

  void checkForce(Celestial c) {

    // Calculate the accleration of the planet
    // Determine the direction of the acceleration
    acceleration = CVector.sub(c.location, location);
    // Get the distance between the two objects for the acceleration calculations
    float distance = acceleration.mag();
    // Change the acceleration vector so it's proportional to the star's mass and
    // inversely proportional to the square of the distance between the star and the planet
    acceleration.normalize();
    acceleration.mult(c.mass/(distance*distance));
  }

  Boolean starCollision(Star s) {

    // Check for a collision at multiple points on the planet's circumference
    for (int j = 0; j < 360; j += 20) {
      // Determine the location of the specific point on the planet's radius
      float x = location.x + cos(radians(j))*radius;
      float y = location.y + cos(radians(j))*radius;
      CVector position = new CVector(x, y);
      // Determine the distance between the point on the planet and the center of the star
      CVector separation = CVector.sub(position, s.location);
      // If that distance is less than or equal to the sun's radius, return true
      if (separation.mag() <= s.radius) {
        s.mass += mass;
        return true;
      }
    }
    // If you've gotten here, there's been no collision with the star in question
    return false;
  }
}