class Star extends Celestial{
  
  
  
  Star(float mass, float radius, float xLocation, float yLocation){
    super(mass, radius, xLocation, yLocation);
  }
  
  void display(){
   
    // Set the colour
    fill(255, 255, 38);
    // Use celestial's display function to draw the star
    super.display();
  }
  
}