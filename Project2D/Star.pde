class Star extends Celestial {

  // To create a planet, you need a location, a mass and a radius
  Star(float mass, float radius, float xLocation, float yLocation) {
    // Give those values to the super constructor
    super(mass, radius, xLocation, yLocation);
    
  }

  void display() {

    // Set the colour to yellow
    fill(255, 255, 38);
    // Use celestial's display function to draw the star
    super.display();
  }
}