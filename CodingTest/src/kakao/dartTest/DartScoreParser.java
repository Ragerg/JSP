package kakao.dartTest;

public class DartScoreParser {
	private int Score;
	private String Equation;
	
	public DartScoreParser(String token1, String token2) {
		char a = token2.charAt(0);
		if(a == 'S' || a == 's') {
			if(token2.length() > 1) {
				// * # 에 대한 처리
			} else {
				Score = Integer.parseInt(token1);
				Equation = token1 + "^1";
			}
		} else if(a == 'D' || a == 'd') {
			if(token2.length() > 1) {
				// * # 에 대한 처리
			} else {
				Score = (int) Math.pow(Integer.parseInt(token1), 2);
				Equation = token1 + "^2";
			}
		} else if(a == 'T' || a == 't') {
			if(token2.length() > 1) {
				// * # 에 대한 처리
			} else {
				Score = (int) Math.pow(Integer.parseInt(token1), 3);
				Equation = token1 + "^3";
			}
		} else {
			System.out.println("ERROR : USE ONLY S/D/T !!!!");
		}
	}

	public int getScore() {
		return Score;
	}

	public void setScore(int score) {
		Score = score;
	}
	
	public String getEquation() {
		return Equation;
	}

	public void setEquation(String equation) {
		Equation = equation;
	}

	
	
}
