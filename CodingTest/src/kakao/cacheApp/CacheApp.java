package kakao.cacheApp;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class CacheApp {
	public static void main(String[] args) {
		
		List<String> cities = new ArrayList<String>();
		
		Scanner sc = new Scanner(System.in);
		System.out.print("캐시크기 : ");
		int chacheSize = sc.nextInt();
		
		System.out.print("도시이름을 넣어주세요(구분자 ,) : ");
		Scanner sc1 = new Scanner(sc.next()).useDelimiter("\\s*,\\s*");
		
		while(sc1.hasNext()) {
			cities.add(sc1.next());
		}
		
		System.out.println(cities);
		
		LRUSchedule LRUSched = new LRUSchedule(chacheSize, cities);
		System.out.println("실행시간 : " + LRUSched.getRunTime());
	}

	
}

