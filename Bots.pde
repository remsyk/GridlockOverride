bot bot;
Ball[] balls = new Ball[10];
PVector randLoc;
PVector botLoc = new PVector(0,0,10);

class bot{
  PVector botVol = new PVector(0,0,10);
  float a=0.01;
  float fric=0.95;

  void botDraw(){
    botVol.x+=a*(abs(shipLoc.x)-botLoc.x);
    botVol.y+=a*(abs(shipLoc.y)-botLoc.y);
    botVol.x*= fric;
    botVol.y*= fric;
    
    float kite = PVector.dist(shipLoc,botLoc);
    
    if(kite<2500){
      for( int i = 0; i <10; i++ ) {
        balls[i].update( botLoc);
      }
      botLoc.x+=botVol.x;
      botLoc.y+= botVol.y;
    }
    
    else{
     
      randLoc=PVector.random2D();
      randLoc.normalize();
      randLoc.mult(9);
      randLoc.lerp(loc,0.01);
      botLoc.x= constrain(botLoc.x, -(boW*cols/4), (boW*cols/2));
      botLoc.y= constrain(botLoc.y, -(boH*rows/10), (boH*rows/2));
      for( int i = 0; i <10; i++ ) {
        balls[i].update( botLoc.add(randLoc) );
      }   
    }   
  }
}

void botSetup(){
  bot = new bot();
  int k= 200;
  for( int i = 0; i < 10; i++ ) {
   balls[i] = new Ball((0.098-(i*0.0093)), (k-=20),(i*100));
  }
}

class Ball {
  
 float cx, cy, constant,bsize,fishColor;
  
 Ball (float cc, int bsize1,float fishColor) {
  constant = cc;
  cx = 100;
  cy = 100;
  this.bsize = bsize1;
  this.fishColor=fishColor;
 } 
 
 void update( PVector pos) {
    float ccx = ((pos.x - cx)*constant) ;
    ccx = ccx*2;
    cx += ccx;
    float ccy = ((pos.y - cy)*constant) ;
    ccy = ccy*2;
    cy += ccy;
   this.render();
 }
 
 void render() {
   fill(this.fishColor%200,this.fishColor%150,100);;
   pushMatrix();
   translate(cx,cy);
   box(this.bsize,this.bsize,this.bsize);
   popMatrix();
 }  
}