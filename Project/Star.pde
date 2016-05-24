class Star extends Celestial {
  
  float SM = (float) (1.989 * pow(10, 30));
  float SR = 695700000;
  int lifeTime;
  float relMass;
  float relRadius;
  
  Star(float _mass, float _radius, float locationX, float locationY){
    super(_mass * SM, _radius * SR, locationX, locationY);
    relMass = _mass;
    relRadius = _radius;
    
    lifeTime = 10 * (pow(relMass, -2.5));
    
  }
  
  void burn(){
    if (lifeTime > 0){
      lifeTime -= 1;
    } 
    
  }
  
}