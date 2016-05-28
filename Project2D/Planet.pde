class Planet extends Celestial {
  
  CVector velocity, acceleration;
  
  Planet(float xLocation, float yLocation, float xVelocity, float yVelocity){
   super(1.0, 5.0, xLocation, yLocation); 
   
   velocity = new CVector(xVelocity, yVelocity);
   acceleration = new CVector(0.0, 0.0);
   
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    fill(225, 225, 225);
    super.display();
    
  }
  
  void checkForce(Celestial c){
   
    //Calculate the force acting on the planet
    CVector force = CVector.sub(c.location, location);
    float distance = force.mag();
    force.normalize();
    force.mult(c.mass/(distance*distance));
    acceleration = force;
    
    
  }
  
  Boolean starCollision(Celestial s){
    
      for (int j = 0; j < 360; j += 30){
        float x = location.x + cos(radians(j))*radius;
        float y = location.y + cos(radians(j))*radius;
        CVector position = new CVector(x, y);
        CVector separation = CVector.sub(position, s.location);
        if (separation.mag() <= s.radius){
          return true;
        } 
      }
    return false;
  }
  
}