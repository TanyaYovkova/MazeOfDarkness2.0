package game;

import java.util.Random;

import player.IPlayer;
import player.Player;
import box.Box;
import box.FightBox;

public  class Game implements IGame {
	private static final int NUMBER_OF_BOXES=10;
	
	private Player playerOne;
	private Player playerTwo;
	private Box box ;
	
	private Maze maze;
	
	public Game(Player playerOne, Player playerTwo, Box box,Maze maze ) {
		this.playerOne = playerOne;
		this.playerTwo = playerTwo;
		this.box = box;
		this.maze = maze;
		
	}
	public void placeBoxes() {
		Random rand = new  Random();
		int idx = rand.nextInt(maze.getEmptyFieldCoords().size());
		int x = maze.getEmptyFieldCoords().get(idx).getX();
		int y = maze.getEmptyFieldCoords().get(idx).getY();
		Coordinates coordsForBox = new Coordinates(x, y);
		box.addBoxCoords(coordsForBox);
		for(int i=1;i<=NUMBER_OF_BOXES;i++){
			while(box.getBoxCoords().contains(coordsForBox)){
				 idx = rand.nextInt(maze.getEmptyFieldCoords().size());
				 x = maze.getEmptyFieldCoords().get(idx).getX();
				 y = maze.getEmptyFieldCoords().get(idx).getY();
				 coordsForBox = new Coordinates(x, y);	
			}
			box.addBoxCoords(coordsForBox);
		}
	}
	
	public void changePosition() {
		// TODO Auto-generated method stub
		
	}

	public void lightUp(int flashLight) {
		// TODO Auto-generated method stub
		
	}
	
	public Maze getMaze() {
		return maze;
	}
	public Player getPlayerOne() {
	
		return playerOne;
	}
	
	public Player getPlayerTwo() {
		
		return playerTwo;
	}
}
