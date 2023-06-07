package kakao.dartTest;

import java.util.Scanner;
import java.util.StringTokenizer;

public class dartApp {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("다트 결과 : ");
		String dartResult = sc.nextLine();
		
		DartResultAnalyzer ra = new DartResultAnalyzer(dartResult);
		int Dartscore = ra.getDartScore();
		String dartScoreEquation = ra.getDartScoreEquation();
		
		System.out.printf("score : %s   equation  : %s", Dartscore, dartScoreEquation);
		
	}
}
