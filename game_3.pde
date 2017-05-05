import processing.opengl.*;
float aa;

void setup() {
  size(1000,1000, OPENGL);
    Map(true);

  shipSetup();
  levelText();
  botSetup();
}

void draw() {
   
  background(30,140,218);
  levelText();
  lights();
  
  pushStyle();
  water();
  popStyle();
  
  pushStyle();
  ship.drawCone( 3, 40, 5, 20, shipLoc, shipDir);  
  shipMove();
  popStyle(); 
  
  trdCam();
  
  if(winCount==8){
    exit();
  }
  
  /** Release in Patch 1.1
 //lookAt = degrees(atan2(mouseX, mouseY));
    lookAt = degrees(atan2(mouseY-(shipLoc.y%1000), mouseX-shipLoc.x%1000));

  //println(lookAt);
   
   pushStyle();
   
   for (int i = bullets.size() - 1; i >= 0; i--) { //Go through each bullet from LAST to FIRST
    bull b = bullets.get(i); //Get the bullet
    b.update();
    b.display(); //Render the bullet
    if (b.finished()){
      bullets.remove(i);
    }
  }
  popStyle();
  */
  /*
  pushStyle();
  bot.botDraw(); 
  popStyle();
  */
  
  //the stroke from the water effects the island draw, and i like the white stroke
  pushStyle();
  Map(false);
  popStyle();
  
  
  if(collisionDetect(botLoc,true)==true){
    winCount=8;
    
  }
  
}

/**Release in Patch1.1
void mousePressed(){
  bullets.add(new bull(shipLoc.x, shipLoc.y, lookAt));  
}
*/