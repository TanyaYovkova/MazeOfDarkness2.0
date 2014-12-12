package player;

public class Statistics {
	private int level;
	private int highScore;
	
	@Override
	public String toString() {
		return "Statistics [level=" + level + ", highScore=" + highScore
				+ ", wins=" + wins + "]";
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getHighScore() {
		return highScore;
	}
	public void setHighScore(int highScore) {
		this.highScore = highScore;
	}
	public int getWins() {
		return wins;
	}
	public void setWins(int wins) {
		this.wins = wins;
	}
	private int wins;
}
