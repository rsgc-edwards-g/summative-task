
float starMass = (float) (1.989 * pow(10,30));
float earthMass = (float) (5.972 * pow(10, 24));
  
Star sun = new Star(starMass, 70.0, width, height);
Planet earth = new Planet(earthMass, 30.0, width/2, 200.0);


void setup(){
  
  size(640, 640);
  
  Star sun = new Star(starMass, 70.0, width, height);
  Planet earth = new Planet(earthMass, 30.0, width/2, 200.0);

  
}


void draw(){
  
  
  
  sun.display();
  
  //earth.checkForce(sun);
  //earth.update();
  earth.display();

  
}