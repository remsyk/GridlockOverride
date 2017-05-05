Ship ship;
float shipDir;
float shipLocX;
float shipLocY;
float shipLocZ;
int num = 40; 
int[] x = new int[num];
int[] y = new int[num];
int indexPosition = 0;
float grow = 0;
float a = 0.0;
boolean up, down, left, right,space;
PVector shipLoc = new PVector(280,10000);
boolean blink=false; //Release in Patch 1.1
int blinkTime = second();
//ArrayList bullets;
//bullet bullet;
float lookAt;
ArrayList<bull> bullets = new ArrayList<bull>(); //An array list of bullets

  class Ship {

  void drawCone( int sides, float r1, float r2, float h, PVector loc, float rot){
    float angle = 360 / sides;
    float halfHeight = h/3;
    fill(#FF0303);
    translate(loc.x,loc.y, loc.z);    
    rotate(radians(rot));


   pushMatrix();
   rotateX(PI/50);
   beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r1;
        float y = sin( radians( i * angle ) ) * r1;
        vertex( x, y, -halfHeight);
    }
    endShape(CLOSE);

    // draw bottom of the tube
    beginShape();

    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r2;
        float y = sin( radians( i * angle ) ) * r2;
        vertex( x, y, halfHeight);
    }
    endShape(CLOSE);
    
    // draw sides
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < sides + 1; i++) {
        float x1 = cos( radians( i * angle ) ) * r1;
        float y1 = sin( radians( i * angle ) ) * r1;
        float x2 = cos( radians( i * angle ) ) * r2;
        float y2 = sin( radians( i * angle ) ) * r2;
        vertex( x1, y1, -halfHeight);
        vertex( x2, y2, halfHeight);    
    }
    endShape(CLOSE);
    popMatrix();

  }
 }

void shipSetup(){
  ship = new Ship();
}

void keyPressed(){
  if(key == 'w'){
    up = true;
  }  
  if(key == 's'){
    down = true;
  }  
  if(key == 'a'){
    left = true;
  }  
  if(key == 'd') {
    right = true;
  }
  if(key==' '){    
    space = true;
  }
}

void keyReleased(){
  if(key == 'w'){
    up = false;
  }  
  if(key == 's'){
    down = false;
  }  
  if(key == 'a'){
    left = false;
  }
  if(key == 'd'){
    right = false;
  }
  if(key==' '){
     space = false;
    }
}

void shipMove(){
  if(up && right){
    //shipLoc.rotate(PI/4);
    shipLoc.x+=70;
    shipLoc.y-=70;
    if(space && blink){
      shipLoc.y-=abs(mouseY-abs(shipLoc.y));
      shipLoc.x+=mouseX;
      blink=false;
    }
  }
  
  else if(up && left){
    //shipLoc.rotate((3*PI)/4);
    shipLoc.x-=70;
    shipLoc.y-=70;
    if(space && blink){
      shipLoc.y-=abs(mouseY-abs(shipLoc.y));
      shipLoc.x-=abs(mouseX-abs(shipLoc.x));
      blink=false;
    }
  }
  
  else if(down && right){
    //shipLoc.rotate((7*PI)/4);
    shipLoc.x+=70;
    shipLoc.y+=70;
    if(space && blink){
      shipLoc.y+=mouseY;
      shipLoc.x+=mouseX;
      blink=false;
    }
  }
  
  else if(down && left){
   // shipLoc.rotate((5*PI)/4);
    shipLoc.x-=70;
    shipLoc.y+=70;
    if(space && blink){
      shipLoc.y+=mouseY;
      shipLoc.x-=abs(mouseX-abs(shipLoc.x));
      blink=false;
    }
  }
  
  else if(up){
   // shipLoc.rotate(PI/2);
    shipLoc.y-=70;
    if(space && blink){
      shipLoc.y-=abs(mouseY-abs(shipLoc.y));
      blink=false;
    }
  }
  
  else if(down){
   // shipLoc.rotate((3*PI)/2);
    shipLoc.y+=70;
    if(space && blink){
      shipLoc.y+=mouseY;
      blink=false;
    }
  }
  
  else if(left){
    //shipLoc.rotate((3.1);
    shipLoc.x-=70;
    if(space && blink){
      shipLoc.x-=abs(mouseX-abs(shipLoc.x));
      blink=false;
    }
  }
  
  else if(right){
   // shipLoc.rotate(0);
    shipLoc.x+=70;
    if(space && blink){
      shipLoc.x+=mouseX;
      blink=false;
      
    }
  /**  Release in Patch 1.1
   if (blink==false){
     if (second()-blinkTime >3){
       blink = true;
       print(blink);
       blinkTime=second();
     }
     
  }
  */
 
}
  shipLoc.x= constrain(shipLoc.x, -(boW*cols/4), (boW*cols));
  shipLoc.y= constrain(shipLoc.y, -(boH*rows/8), (boH*rows));
}

class bull {
  float xPos = 0;
  float yPos = 0;
  float angle = 0;
  float spd = 5085;
  float life = 50;


  bull(float _x, float _y, float _a) {
    xPos = _x;
    yPos = _y;
    angle = _a;
  }

  void display() {
    pushMatrix();
    noStroke();
    ellipse(xPos, yPos, 10, 10);
    popMatrix();
  }
    
 void update(){
    xPos += spd * cos(radians(angle));
    yPos += spd * sin(radians(angle));

  }
  
  boolean finished() {
    // Balls fade out
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
}


void water(){
    x[indexPosition] = (int)shipLoc.x;
    y[indexPosition] = (int)shipLoc.y;
    indexPosition = (indexPosition + 1) % num;
    
    for (int i = 0; i<num; i++) {
    
      int pos = (indexPosition +i) % num;
      float radius = (num-i) /2.5;
      pushMatrix();
      stroke(255,30);
      a+=0.002;
      grow = cos(a)+10;
      noFill();
      smooth();
      ellipse(x[pos], y[pos], radius*3+grow, radius*3+grow);
      ellipse(x[pos], y[pos], radius*2-10+grow, radius*2-10+grow);
      popMatrix();
      if (grow>=40.0){
          grow=0;
      }
  }
}



void trdCam () { 
    //change back to shiplocY+300, shiplocZ+800
  camera(shipLoc.x, shipLoc.y+800, shipLoc.z+4000, shipLoc.x, shipLoc.y, shipLoc.z, 0, 1, 0);
}