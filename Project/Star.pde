class Star {
  
  // Create the variables that will change as the star dies and the location vector
  float mass, radius;
  CVector location;
  // Add as much red and green to the star as possible to make the star yellow
  int red = 255;
  int green = 255;
  // There should be no blue until the star starts to turn white
  int blue = 0;
  
  // The star requires a mass, radius and location coordinates
  Star(float _mass, float _radius, float locationX, float locationY){
    // Set the global variables for use later
    mass = _mass;
    radius = _radius;
    location = new CVector(locationX, locationY);
     
  }

  void display() {
    
    // Draw the sphere by translating the coordinate system in the x and y directions
    pushMatrix();
    translate(location.x, location.y, 0);
    // So that we can see the core, a star should have lines but not be filled
    stroke(red, green, blue);
    noFill();
    // Draw the sphere and return the coordinate system to its original location
    sphere(radius);
    popMatrix();
  }
  
  void death(){
    // While there is still mass on the star's "counter," turn it into a red giant
    if (mass > 0) {
      // Take mass off the mass counter
      mass -= 4;
      // If there's green in the star, decrease it to make the star redder
      if (green > 0) {
        green -= 2;
      }
      // Increment the radius to make it larger
      radius++; 
    } else if (green < 255 || blue < 255) {
      // if the star isn't white yet, continue to change the colour values to make the star whiter
      green += 2;
      blue += 2;
      // Decrease the radius to make the outer layers shrink (since the star is becoming a white dwarf star)
      // Only decrease the radius if it's bigger than 0. Otherwise it will suddenly get larger again
      if (radius > 0){
        radius -= 2;
      }
    } 
  }
  
}