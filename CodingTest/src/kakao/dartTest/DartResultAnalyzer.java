package kakao.dartTest;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class DartResultAnalyzer {
	private int DartScore;
	private String DartScoreEquaton;
	
	public DartResultAnalyzer(String dartResult) {
		List<Integer> Score = new ArrayList<>();
		List<String> ScoreEquaion = new ArrayList<>();
		StringTokenizer st = new StringTokenizer(dartResult, "0123456789", true);
		
		while(st.hasMoreElements()) {
			String token1 = st.nextToken();
			String token2 = st.nextToken();
			
			if(token1.equals("1") && token2.equals("0")) {
				token1 = "10";
				token2 = st.nextToken();
			} else { 
				//NoOP
			}
			System.out.printf("score : %s   Option %s\n", token1, token2);
			DartScoreParser sp = new DartScoreParser(token1, token2);
			Score.add(sp.getScore());
			ScoreEquaion.add(sp.getEquation());
		}
	}

	public int getDartScore() {
		return DartScore;
	}

	public void setDartScore(int dartScore) {
		DartScore = dartScore;
	}

	public String getDartScoreEquaton() {
		return DartScoreEquaton;
	}

	public void setDartScoreEquaton(String dartScoreEquaton) {
		DartScoreEquaton = dartScoreEquaton;
	}
	
	
}
