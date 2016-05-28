class Celestial {



  Celestial(float _mass, float _radius, float location_x, float location_y) {
    
  }

  void display() {
    fill(0, 0, 0);
    
    pushMatrix();
    translate(location.x, location.y, 0);
    sphere(radius/9900);
    popMatrix();
    
  }

  
}