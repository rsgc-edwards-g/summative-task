class Planet extends Celestial {

  CVector velocity, acceleration;

  Planet(float xLocation, float yLocation, float xVelocity, float yVelocity) {
    super(1.0, 5.0, xLocation, yLocation); 

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

    //Calculate the force acting on the planet
    CVector force = CVector.sub(c.location, location);
    float distance = force.mag();
    force.normalize();
    force.mult(c.mass/(distance*distance));
    acceleration = force;
  }

  Boolean starCollision(Celestial s) {

    for (int j = 0; j < 360; j += 30) {
      float x = location.x + cos(radians(j))*radius;
      float y = location.y + cos(radians(j))*radius;
      CVector position = new CVector(x, y);
      CVector separation = CVector.sub(position, s.location);
      if (separation.mag() <= s.radius) {
        return true;
      }
    }
    return false;
  }
}