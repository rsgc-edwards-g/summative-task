class Celestial {

  float mass, radius;
  CVector location; 
 
  


  Celestial(float _mass, float _radius, float location_x, float location_y) {
    location = new CVector(location_x, location_y);
    
    mass = _mass;
    radius = _radius;
  }

  void display() {
    fill(0, 0, 0);
    
    pushMatrix();
    translate(location.x, location.y, 0);
    sphere(radius/9900);
    popMatrix();
    
  }

  
}