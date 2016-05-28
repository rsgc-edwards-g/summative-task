class Planet extends Celestial {
  
  CVector velocity; 
  CVector acceleration;
  CVector netForce;
  
  float gravConst = (float) (6.67 * Math.pow(10.0, -11.0));
  
  Planet(float _mass, float _radius, float locationX, float locationY){
    super(_mass, _radius, locationX, locationY);
    
    velocity = new CVector(0.0, 0.0);
    netForce = new CVector(0.0, 0.0);
    
    
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }

  void checkForce(Celestial c) {
    float distance = (float)CVector.sub(c.location, location).mag();
    float force = gravConst * mass * c.mass / pow(distance, 2);

    CVector forceVector = CVector.sub(c.location, location);
    forceVector.normalize();
    forceVector.mult(force);
    netForce.add(forceVector);

    acceleration = CVector.div(netForce, mass);
  }
  
}