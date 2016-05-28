class Star extends Celestial {
  
  float SM = (float) (1.989 * pow(10, 30));
  int lifeTime;
  float relMass;
  float relRadius;
  
  Star(float _mass, float _radius, float locationX, float locationY){
    super(_mass, _radius, locationX, locationY);
     
  }

  
  
}