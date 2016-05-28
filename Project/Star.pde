class Star {
  
  float mass, radius;
  CVector location;
  int red = 255;
  int green, blue;
  
  Star(float _mass, float _radius, float locationX, float locationY){
    mass = _mass;
    radius = _radius;
    location = new CVector(locationX, locationY);
    green = 255;
    blue = 0;
     
  }

  void display() {
    
    // Draw the sphere by translating the coordinate system
    pushMatrix();
    translate(location.x, location.y, 0);
    stroke(red, green, blue);
    noFill();
    sphere(radius);
    popMatrix();
  }
  
  void death(){
    if (mass > 0) {
      mass -= 4;
      if (green > 0) {
        green -= 4;
      }
      radius++; 
    } else if (green < 255) {
      green += 4;
      blue += 4;
      radius -= 6;
    } else if (mass == 0 && green == 255) {
      fill(red, green, blue);
    }
  }
  
}