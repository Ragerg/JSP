package kakao.cacheApp;

import java.util.List;

public class LRUSchedule {
	
	private int runTime;
	private int hitTime = 1;
	private int missTime = 5;
	
	public LRUSchedule(int cacheSize, List<String> cities) {
		
		runTime = 0;
		
		LRUCache LRU = new LRUCache(cacheSize);
		int idxCity = 0;
		
		while(idxCity < cities.size()) {
			if(LRU.getCity(cities.get(idxCity))) {
				runTime += hitTime;
			} else {
				runTime += missTime;
			}
			idxCity++;
		}
	}

	public int getRunTime() {
		return runTime;
	}

}
