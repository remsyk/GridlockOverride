import processing.core.PVector;

import java.util.ArrayList;

import processing.core.PApplet;

public class map{

	int cols = 60;
	int rows = 60;
	int boW = 300;
	int boH = 300;
	Cell[][] grid;
	PVector[] boxLocRand = new PVector[100];
	int n;
	ArrayList<PVector> gridFilled;
	PVector portalLoc;
	int winCount = 0;
	islandOne islandOne;

	public map(PApplet parent) {

		grid = new Cell[rows][cols];

		for (int l = 0; l < boxLocRand.length; l++) {

			boxLocRand[l] = new PVector((int)parent.random(0, rows - 10), (int)parent.random(0, cols - 10));

		}

		for (int i = 0; i < rows; i++) {
			for (int j = 0; j < cols; j++) {
				
				PVector boxLoc = new PVector(i * 300, j * 300, 20);
				grid[i][j] = new Cell(boxLoc, (int)parent.random(0, 100));

			}
		}

	}

	public void draw(PApplet parent,PVector shipLoc) {
		for (int i = 0; i < rows; i++) {
			for (int j = 0; j < cols; j++) {

				grid[i][j].draw(parent);

			}
		}
	}

}