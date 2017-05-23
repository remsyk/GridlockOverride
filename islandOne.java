import processing.core.PVector;
import processing.core.PApplet;


public class islandOne extends PApplet {
	 Cell[][] grid;

	
	public islandOne(PVector r, int i, int j) {
		PVector boxLoc = new PVector(i * 300, j * 300, 20);
		// this is will a certain random variable and i,j from the loop below
		// and draw the boxes from that random variable location to a X,Y range
		if (i > r.x && i < r.x + 5 && j > r.y && j < r.y + 5) {
			
			grid[i][j] = new Cell(boxLoc, (int)random(0, 100));
			
		}
		if (i > r.x + 1 && i < r.x + 4 && j > r.y + 1 && j < r.y + 4) {
			
			grid[i][j] = new Cell(boxLoc, (int)random(100, 600));
			
		}
		//////////////////////////////////
		if (i > r.x && i < r.x + 5 && j > r.y + 5 && j < r.y + 10) {
			
			grid[i][j] = new Cell(boxLoc, (int)random(0, 100));
			
		}
		if (i > r.x + 1 && i < r.x + 4 && j > r.y + 6 && j < r.y + 9) {
			
			grid[i][j] = new Cell(boxLoc, (int)random(100, 1000));
			
		}
	}
		
	  public void draw(PVector r, int i, int j, PVector shipLoc) {

		if (i > r.x && i < r.x + 5 && j > r.y && j < r.y + 5) {
			
			grid[i][j].draw(true, shipLoc, color(240, 230, 140), false);

		}
		if (i > r.x + 1 && i < r.x + 4 && j > r.y + 1 && j < r.y + 4) {
			
			grid[i][j].draw(true, shipLoc, color(50, 205, 50), false);
			
		}
		//////////////////////////////////
		if (i > r.x && i < r.x + 5 && j > r.y + 5 && j < r.y + 10) {
			
			grid[i][j].draw(true, shipLoc, color(240, 230, 140), false);
			
		}
		if (i > r.x + 1 && i < r.x + 4 && j > r.y + 6 && j < r.y + 9) {
			
			grid[i][j].draw(true, shipLoc, color(50, 205, 50), false);
			
		}
	}
}
