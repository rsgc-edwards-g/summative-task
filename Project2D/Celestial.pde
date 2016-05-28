class Celestial {

  // Create the necessary variables 
  float mass, radius;
  CVector location;

  Celestial(float _mass, float _radius, float xPosition, float yPosition) {

    // Define the variables
    mass = _mass;
    radius = _radius;
    location = new CVector(xPosition, yPosition);
  }


  void display() {
    // Draw the circle
    ellipse(location.x, location.y, radius * 2, radius * 2);
  }
}