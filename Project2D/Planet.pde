class Planet extends Celestial {
  
  CVector velocity;
  int red, green, blue;
  
  Planet(float xLocation, float yLocation, float xVelocity, float yVelocity){
   super(1.0, 10.0, xLocation, yLocation); 
   
   velocity = new CVector(xVelocity, yVelocity);
   
   red = (int)random(30);
   green = (int)random(255);
   blue = (int)random(200);
   
  }
  
  void display(){
   
    // Set the colour
    fill(red, green, blue);
    // Draw the circle with celestial's display function
    super.display();
  }
  
  void update(){
    location.add(velocity);
  }
  
  
  void checkForce(Celestial c){
   
    //Calculate the force acting on the planet
    CVector force = CVector.sub(c.location, location);
    float distance = force.mag();
    force.normalize();
    force.mult(mass/pow(distance, 2));
    
    //Calculate the object's new velocity and location
    CVector newVelocity = velocity;
    newVelocity.add(force);
    location.add(newVelocity);
  }
  
  Boolean starCollision(Celestial s){
    for (int i = 0; i < 360; i += 30){
      float planetX = location.x + cos(radians(i))*radius;
      float planetY = location.y + sin(radians(i))*radius;
      CVector planetPos = new CVector(planetX, planetY);
      for (int j = 0; j < 360; j += 30){
        float starX = s.location.x + cos(radians(j))*s.radius;
        float starY = s.location.y + cos(radians(j))*s.radius;
        CVector starPos = new CVector(starX, starY);
        CVector separation = CVector.sub(starPos, planetPos);
        if (separation.mag() < s.radius){
          return true;
        } 
      }
    }
    return false;
  }
  
}