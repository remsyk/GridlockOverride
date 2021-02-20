import java.awt.Color;
import processing.core.PApplet;
import processing.core.PVector;

public class Cell {
  PVector boxLoc;
  float d;
  int boW = 300;
  int boH = 300;
  float pulseChange;

  
  Cell( PVector boxLoc, float d) {
    this.boxLoc = boxLoc;
    this.d = d;
    
  }
  public void draw(PApplet parent) {
	parent.pushMatrix();
    parent.translate(this.boxLoc.x,this.boxLoc.y,this.boxLoc.z);
    parent.fill(240, 230, 140);
    parent.noStroke();
    parent.box(boW, boH, d);
    parent.popMatrix();   
  }
}