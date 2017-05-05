int cols = 60;
int rows = 60;
int boW = 300;
int boH = 300;
Cell[][] grid;
PVector[] rand = new PVector[31];
float portalHeight;
float ll;
PVector[] fake = new PVector[60];
ArrayList<PVector>filled = new ArrayList<PVector>();
 PVector loc;
 int portalMoveCount =0;
int winCount=0;

class Cell {
  PVector boxLoc;
  float d;

  Cell(PVector boxLoc, float d) {
    this.boxLoc = boxLoc;
    this.d = d;
  }
   
  PVector display(boolean collDetectON, int fill,boolean pulseFill) {
    pushMatrix();
    //translate(this.boxe.x-(boW*cols/2),this.boxe.y-(boH*rows/2),this.boxe.z);
    translate(this.boxLoc.x,this.boxLoc.y,this.boxLoc.z);
    if(pulseFill){
      float pulse = sin(ll+=.05)*100;
      fill(fill, pulse);
      stroke(#87CEFA);  
      strokeWeight(7);
    }
    else{
    fill(fill);
    noStroke();
    }
    collisionDetect(boxLoc,collDetectON);
    box(boW, boH, d);
    popMatrix();   

  return boxLoc;
  }
}

PVector islandOne(PVector r, int i, int j, boolean draw){
    PVector boxLoc = new PVector(i*300,j*300,20);
   if (i>r.x && i<r.x+5 && j>r.y && j<r.y+5){ 
     if(draw){
        grid[i][j].display(true,#F0E68C,false);
       }
       else{
         grid[i][j] = new Cell(boxLoc,(int)random(0,100));  
       }
    }       
    if (i>r.x+1 && i<r.x+4 && j>r.y+1 && j<r.y+4){ 
       if(draw){
          grid[i][j].display(true,#32CD32,false);
       }
       else{
         grid[i][j] = new Cell(boxLoc,(int)random(100,600));
       }
     }
    //////////////////////////////////
     if (i>r.x && i<r.x+5 && j>r.y+5 && j<r.y+10){ 
     if(draw){
         grid[i][j].display(true,#F0E68C,false);
       }
       else{
         grid[i][j] = new Cell(boxLoc,(int)random(0,100));  
       }
    }       
    if (i>r.x+1 && i<r.x+4 && j>r.y+6 && j<r.y+9){ 
       if(draw){
          grid[i][j].display(true,#32CD32,false);
       }
       else{
         grid[i][j] = new Cell(boxLoc,(int)random(100,1000));
       }
     }
     return boxLoc;
  }
 
  void islandTwo(PVector r, int i, int j,boolean draw){
     PVector boxLoc = new PVector(i*300,j*300,20);
   
     if (i>r.x && i<r.x+6 && j>r.y && j<r.y+10){ 
      if(draw){
         grid[i][j].display(true,#F0E68C,false);
       }
       else{
       grid[i][j] = new Cell(boxLoc,(int)random(0,100));  
       }
    }       
    if (i>r.x+1 && i<r.x+5 && j>r.y+1 && j<r.y+9){ 
      if(draw){
          grid[i][j].display(true,#32CD32,false);
       }
       else{
       grid[i][j] = new Cell(boxLoc,(int)random(100,600));  
     }
     }
     if (i>r.x+2 && i<r.x+4 && j>r.y+2 && j<r.y+8){ 
        if(draw){
           grid[i][j].display(true,#331900,false);
        }
        else{
       grid[i][j] = new Cell(boxLoc,(int)random(600,2000));
        }
     }
     
     //////////////////////////////////////////////////////////
   if (i>r.x+6 && i<r.x+16 && j>r.y && j<r.y+5){ 
      if(draw){
         grid[i][j].display(true,#F0E68C,false);
       }
       else{
       grid[i][j] = new Cell(boxLoc,(int)random(0,100));  
       }
    }       
    if (i>r.x+7 && i<r.x+15 && j>r.y+1 && j<r.y+4){ 
      if(draw){
          grid[i][j].display(true,#32CD32,false);
       }
       else{
       grid[i][j] = new Cell(boxLoc,(int)random(100,600));  
     }
     }
     if (i>r.x+8 && i<r.x+4 && j>r.y+2 && j<r.y+3){ 
        if(draw){
           grid[i][j].display(true,#331900,false);
        }
        else{
       grid[i][j] = new Cell(boxLoc,(int)random(600,2000));
        }
     }
  }
  
  PVector portal(int i, int j, boolean draw){
     PVector boxLoc = new PVector(i*300,j*300,0);
     PVector test = new PVector();

     if(draw){
          if(i==loc.x && j==loc.y){
           //translate(0,0,-portalHeight+500); //Release in Patch 1.1
            test = grid[i][j].display(false,#F5F5F5,true);
            return test;
         }
       }
       else{
         if(i==loc.x && j==loc.y){
            grid[i][j] = new Cell(boxLoc,1000);
         }
       }
       return test;
    } 
    
  int n=0;

  void Map(boolean setup){   
    
    if(setup){
      grid = new Cell[rows][cols];
      loc = new PVector((int)random(20,60),(int)random(20,50)); 
  
       for (int l=0; l<rand.length; l++){
         rand[l]= new PVector((int)random(0,rows-10),(int)random(0,cols-10));
         filled.add(rand[l]);
       }
    }
    
    for (int i = 0; i < rows; i++) {
      n+=1;
      int m=0;
      for (int j = 0; j < cols; j++) {
        m+=1;

        if(setup){
          if (n<30 && m<16){
            PVector temp = rand[n];
            temp.x+=n-1;
            temp.y+=m-1;        
            filled.add(temp);
            println(filled);
          }
          
          islandOne(rand[0],i,j,false); 
          islandOne(rand[1],i,j,false); 
          islandOne(rand[2],i,j,false);
          islandTwo(rand[3],i,j,false); 
          islandOne(rand[4],i,j,false); 
          islandOne(rand[5],i,j,false);
          islandTwo(rand[6],i,j,false); 
          islandOne(rand[7],i,j,false); 
          islandOne(rand[8],i,j,false);
          islandTwo(rand[9],i,j,false);
          islandOne(rand[10],i,j,false); 
          islandOne(rand[11],i,j,false);
          islandTwo(rand[12],i,j,false);
          islandOne(rand[13],i,j,false); 
          islandOne(rand[14],i,j,false);
          islandTwo(rand[15],i,j,false); 
          islandOne(rand[16],i,j,false); 
          islandOne(rand[17],i,j,false);
          islandTwo(rand[18],i,j,false);
          islandOne(rand[19],i,j,false); 
          islandOne(rand[20],i,j,false);   
          islandTwo(rand[21],i,j,false);
          islandOne(rand[22],i,j,false); 
          islandOne(rand[23],i,j,false);
          islandTwo(rand[24],i,j,false); 
          islandOne(rand[25],i,j,false); 
          islandOne(rand[26],i,j,false);
          islandTwo(rand[27],i,j,false); 
          islandOne(rand[28],i,j,false); 
          islandOne(rand[29],i,j,false);
          islandTwo(rand[30],i,j,false); 
          portal(i,j,false);  
        }
        else{
          pushStyle();
          islandOne(rand[0],i,j,true);
          islandOne(rand[1],i,j,true); 
          islandOne(rand[2],i,j,true);
          islandTwo(rand[3],i,j,true);    
          islandOne(rand[4],i,j,true); 
          islandOne(rand[5],i,j,true);
          islandTwo(rand[6],i,j,true); 
          islandOne(rand[7],i,j,true); 
          islandOne(rand[8],i,j,true);
          islandTwo(rand[9],i,j,true);     
          islandOne(rand[10],i,j,true); 
          islandOne(rand[11],i,j,true);
          islandTwo(rand[12],i,j,true);
          islandOne(rand[13],i,j,true); 
          islandOne(rand[14],i,j,true);
          islandTwo(rand[15],i,j,true); 
          islandOne(rand[16],i,j,true); 
          islandOne(rand[17],i,j,true);
          islandTwo(rand[18],i,j,true);
          islandOne(rand[19],i,j,true);       
          islandOne(rand[20],i,j,true);
          islandTwo(rand[21],i,j,true);
          islandOne(rand[22],i,j,true); 
          islandOne(rand[23],i,j,true);
          islandTwo(rand[24],i,j,true); 
          islandOne(rand[25],i,j,true); 
          islandOne(rand[26],i,j,true);
          islandTwo(rand[27],i,j,true); 
          islandOne(rand[28],i,j,true); 
          islandOne(rand[29],i,j,true);
          islandTwo(rand[30],i,j,true);
          popStyle();
        
          pushMatrix();
          pushStyle();
        //as ship gets closer to portal it rises out of the water, but only if the user has enough experience to unlock, if user doesn't have enough experience the portal will move
        //PVector portalLoc1 = portal(i,j,true);
        //portalHeight= PVector.dist(portalLoc1, shipLoc); 
        
          if(collisionDetect(portal(i,j,true),true)){
            winCount+=1;
            shipLoc.x=280;
            shipLoc.y=10000;
            setup();
          }
        
          popStyle();
          popMatrix();
        }
   }
  }
 }


 
 boolean collisionDetect(PVector boxLoc, boolean collDetectON){
   
   if (collDetectON==true){
   
    //Right Side Collison
     if((shipLoc.x-20)<(boxLoc.x+200) && (shipLoc.x)>(boxLoc.x-20) && (shipLoc.y)>(boxLoc.y-150) && (shipLoc.y)<(boxLoc.y+150)){
       shipLoc.x+=70;
       return true;
     }
     
     //Left Side Collision
       if((shipLoc.x+20)>(boxLoc.x-200) && (shipLoc.x)<(boxLoc.x+20) && (shipLoc.y)>(boxLoc.y-150) && (shipLoc.y)<(boxLoc.y+150)){
       shipLoc.x-=70;
       return true;
      }
 
      //Bottom Side Collision
       if((shipLoc.y-20)<(boxLoc.y+220) && (shipLoc.y)>(boxLoc.y-20) && (shipLoc.x)>(boxLoc.x-160) && (shipLoc.x)<(boxLoc.x+160)){
       shipLoc.y+=70;   
       return true;
      }
      
      //Top Side Collision
       if((shipLoc.y+20)>(boxLoc.y-220) && (shipLoc.y)<(boxLoc.y+20)&& (shipLoc.x)>(boxLoc.x-160) && (shipLoc.x)<(boxLoc.x+160)){
       shipLoc.y-=70;
       return true;
      }
      
   }
   return false;
 }
 
 void levelText (){
   String [] levels = {"Level: 1-------> Find Portal","Level: 2------->","Level: 3------->","Level: 4------->","Level: 5------->","Level: 6------->","Level: 7------->","YOU WIN!","YOU LOSE!"};
   textSize(300);
   text(levels[winCount],0,10000.0);  
 }
 