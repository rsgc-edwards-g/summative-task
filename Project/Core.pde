class Core {
  
  // Create the variables that are going to be changing as the core shrinks as well as the location vector
  float mass, radius;
  CVector location;
  int colour = 225;
  
  // The core only needs a star and can determine its own properties from that
  Core(Star s){
    // Mass is only a counter in this scenario. A real star's core won't lose all of its mass
    mass = s.mass / 2;
    radius = s.radius / 2;
    // The core is at the exact center of the star
    location = s.location;
    
  }
  
  void display() {
    
    // Draw the sphere by translating the coordinate system
    pushMatrix();
    translate(location.x, location.y, 0);
    // Cores are uniform so they are filled, not stroked
    noStroke();
    // The core should be some shade of gray so the RGB values are all the same
    fill(colour, colour, colour);
    // Add lights to make the core seem 3D
    lights();
    // Draw the sphere at (0,0), which has been translated
    sphere(radius);
    // Return the coordinate system to its original position
    popMatrix();
  }
  
  void collapse(float starRadius) {
    // If the core still has mass on its "counter" decrement the mass and the radius
    if (mass > 0) {
      mass -= 2;
      radius -= 0.1;
      // If the colour of the core isn't dark gray yet, keep decrementing the colour code
      if (colour > 100){
        colour -= 2;
      }
    }  
    // When the star's radius is less than the core, the star has become a white dwarf
    // Change the colour to white to show that it has become a white dwarf
    if (starRadius < radius) {
     colour = 255; 
    }
    
  }
  
}