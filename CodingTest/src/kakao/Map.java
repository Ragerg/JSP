package kakao;

import java.util.Arrays;
import java.util.Scanner;
import java.util.Stack;

public class Map {
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("지도 한 변의 크기를 입력해 주세요");
		int n = sc.nextInt();
		
		int[] arr1 = new int[n];
		int[] arr2 = new int[n];
		int[] outArr = new int[n]; //OR 연산결과
		String[] outString = new String[n]; // 출력문자열
		
		System.out.println("arr1에 들어갈 " + n + "개의 숫자를 입력하세요");
		for(int i = 0; i < n;) {
			int a = sc.nextInt();
			if(0 <= a && a <= Math.pow(2, n)-1) {
				arr1[i] = a;
				i++;
			}
		}
		
		System.out.println("arr2에 들어갈 " + n + "개의 숫자를 입력하세요");
		for(int i = 0; i < n;) {
			int a = sc.nextInt();
			if(0 <= a && a <= Math.pow(2, n)-1) {
				arr2[i] = a;
				i++;
			}
		}
		
		//연산
		for(int i = 0; i < n; i++) {
			outArr[i] = arr1[i] | arr2[i];
			outString[i] = Integer.toBinaryString(outArr[i]);
			outString[i] = outString[i].replace('1', '#');
			outString[i] = outString[i].replace('0', ' ');
		}		
		
		System.out.println(Arrays.toString(outString));
		
		sc.close();
	}

}
