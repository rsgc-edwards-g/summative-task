class Core {
  
  float mass, radius;
  CVector location;
  int colour = 225;
  
  Core(Star s, float _radius){
    mass = s.mass;
    radius = _radius;
    location = s.location;
    
  }
  
  void display() {
    
    // Draw the sphere by translating the coordinate system
    pushMatrix();
    translate(location.x, location.y, 0);
    noStroke();
    fill(colour, colour, colour);
    sphere(radius);
    popMatrix();
  }
  
  void collapse(float starRadius) {
    if (mass > 0) {
      mass -= 4;
      radius -= 0.1;
      if (colour > 100){
        colour -= 2;
      }
    }  
    if (starRadius < radius) {
     colour = 255; 
    }
    
  }
  
}