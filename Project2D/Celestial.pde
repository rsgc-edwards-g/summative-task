class Celestial {
  
  float mass, radius;
  CVector location;
  
  Celestial(float _mass, float _radius, float xPosition, float yPosition){
    
    mass = _mass;
    radius = _radius;
    location = new CVector(xPosition, yPosition);
    
  }
  
  
  void display(){
    
    fill(0, 0, 90);
    
    ellipse(location.x, location.y, radius * 2, radius * 2);
  }
  
}