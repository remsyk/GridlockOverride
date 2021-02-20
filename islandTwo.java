import processing.core.PVector;
import processing.core.PApplet;


public class islandTwo extends PApplet{
	Cell[][] grid;
	
	
	islandTwo(PVector r, int i, int j) {
		PVector boxLoc = new PVector(i * 300, j * 300, 20);
		if (i > r.x && i < r.x + 6 && j > r.y && j < r.y + 10) {

			grid[i][j] = new Cell(boxLoc, (int) random(0, 100));

		}
		if (i > r.x + 1 && i < r.x + 5 && j > r.y + 1 && j < r.y + 9) {

			grid[i][j] = new Cell(boxLoc, (int) random(100, 600));

		}
		if (i > r.x + 2 && i < r.x + 4 && j > r.y + 2 && j < r.y + 8) {

			grid[i][j] = new Cell(boxLoc, (int) random(600, 2000));

		}

		//////////////////////////////////////////////////////////
		if (i > r.x + 6 && i < r.x + 16 && j > r.y && j < r.y + 5) {

			grid[i][j] = new Cell(boxLoc, (int) random(0, 100));

		}
		if (i > r.x + 7 && i < r.x + 15 && j > r.y + 1 && j < r.y + 4) {

			grid[i][j] = new Cell(boxLoc, (int) random(100, 600));

		}
		if (i > r.x + 8 && i < r.x + 4 && j > r.y + 2 && j < r.y + 3) {

			grid[i][j] = new Cell(boxLoc, (int) random(600, 2000));

		}
	}
	
	void draw(PVector r, int i, int j, PVector shipLoc) {
		PVector boxLoc = new PVector(i * 300, j * 300, 20);
		if (i > r.x && i < r.x + 6 && j > r.y && j < r.y + 10) {

			grid[i][j].draw(true, shipLoc, color(240, 230, 140), false);

		}
		if (i > r.x + 1 && i < r.x + 5 && j > r.y + 1 && j < r.y + 9) {

			grid[i][j].draw(true, shipLoc, color(50, 205, 50), false);

		}
		if (i > r.x + 2 && i < r.x + 4 && j > r.y + 2 && j < r.y + 8) {

			grid[i][j].draw(true, shipLoc, color(51, 25, 0), false);

		}

		//////////////////////////////////////////////////////////
		if (i > r.x + 6 && i < r.x + 16 && j > r.y && j < r.y + 5) {

			grid[i][j].draw(true, shipLoc, color(240, 230, 140), false);

		}
		if (i > r.x + 7 && i < r.x + 15 && j > r.y + 1 && j < r.y + 4) {

			grid[i][j].draw(true, shipLoc, color(50, 205, 50), false);

		}
		if (i > r.x + 8 && i < r.x + 4 && j > r.y + 2 && j < r.y + 3) {

			grid[i][j].draw(true, shipLoc, color(51, 25, 0), false);

		}
	}
}
