class Planet extends Celestial {
  
  float gravConst = (float) (6.67 * Math.pow(10.0, -11.0));
  
  CVector netForce, velocity, acceleration;
  
  Planet(float mass, float radius, float xLocation, float yLocation){
   super(mass, radius, xLocation, yLocation); 
   
   velocity = new CVector(0.0, 0.0);
   netForce = new CVector(0.0, 0.0);
   acceleration = new CVector(0.0, 0.0);
    
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
  }
  
  
  void checkForce(Celestial c){
   
    float distance = (float)(CVector.sub(c.location, location).mag());
    float force = gravConst * mass * c.mass / pow(distance, 2);

    CVector forceVector = CVector.sub(c.location, location);
    forceVector.normalize();
    forceVector.mult(force);
    netForce.add(forceVector);

    acceleration = CVector.div(netForce, mass);
    
  }
  
  
}