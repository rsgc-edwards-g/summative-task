class Planet extends Celestial {
  
  CVector velocity;
  int red, green, blue;
  
  Planet(float xLocation, float yLocation, float xVelocity, float yVelocity){
   super(1.0, 5.0, xLocation, yLocation); 
   
   velocity = new CVector(xVelocity, yVelocity);
   
   red = (int)random(30);
   green = (int)random(255);
   blue = (int)random(200);
   
  }
  
  void update(Celestial c){
   
    //Calculate the force acting on the planet
    CVector force = CVector.sub(c.location, location);
    float distance = force.mag();
    force.normalize();
    force.mult(mass/(distance*distance));
    
    // Calculate the new location and velocity
    CVector newVelocity = velocity;
    newVelocity.add(force);
    location.add(newVelocity);
    
    // Draw the ellipse
    fill(red, green, blue);
    super.display();
  }
  
  Boolean starCollision(Celestial s){
    
      for (int j = 0; j < 360; j += 30){
        float x = location.x + cos(radians(j))*radius;
        float y = location.y + cos(radians(j))*radius;
        CVector position = new CVector(x, y);
        CVector separation = CVector.sub(position, s.location);
        if (separation.mag() < s.radius){
          return true;
        } 
      }
    return false;
  }
  
}