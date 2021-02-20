import processing.core.PApplet;
import processing.core.PVector;

public class src extends PApplet{

	map map;
	PVector shipLoc = new PVector(100,100,10);
	
	public static void main(String[] args) {
		 PApplet.main(new String[] { src.class.getName() });
		 //String[] pArgs = {"src "};
		 //src src = new src ();
		 //PApplet.runSketch(pArgs, src);
	}
	
	public void settings(){
		size(1000,1000, P3D);
    }

    public void setup(){
    	map = new map(this);
    }

    public void draw(){
    	background(30,140,218);
    	pushMatrix();
    	map.draw(this,shipLoc);
    	popMatrix();
    	
    }

}