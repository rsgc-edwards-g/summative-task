class Celestial {

  float mass, radius;
  CVector location; 
  CVector velocity; 
  CVector acceleration;
  float gravConst = (float) (6.67 * pow(10.0, -11.0));

  CVector netForce;

  Celestial(float _mass, float _radius, float location_x, float location_y) {
    location = new CVector(location_x, location_y);
    velocity = new CVector(0, 0);
    netForce = new CVector(0, 0);
    
    mass = _mass;
    radius = _radius;
  }

  void update() {
    acceleration = div(netForce, mass);
    velocity.add(acceleration);
    location.add(velocity);
  }

  void display() {
    fill(0, 0, 90);
    
    pushMatrix();
    translate(location.x, location.y, 0);
    sphere(radius);
    popMatrix();
    
  }

  void checkForce(Celestial c) {
    float distance = mag(sub(c.location, location));
    float force = gravConst * mass * c.mass / pow(distance, 2);

    CVector forceVector = ((sub(c.location, location)).div(distance)).mult(force);
    netForce.add(forceVector);

    velocity.x += (-1 * netForce.y / mass);
    velocity.y += (netForce.x / mass);
  }
}