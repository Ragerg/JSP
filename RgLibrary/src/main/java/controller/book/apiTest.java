package controller.book;

// 네이버 검색 API 예제 
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class apiTest {

	    public static void main(String[] args) {
	        String clientId = ""; //애플리케이션 클라이언트 아이디
	        String clientSecret = ""; //애플리케이션 클라이언트 시크릿


	        String text = null;
	        try {
	            text = URLEncoder.encode("9788959895205", "UTF-8"); // 검색어
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("검색어 인코딩 실패",e);
	        }

	        // 네이버 책검색 api로 url 변경했음
	        String apiURL = "https://openapi.naver.com/v1/search/book.json?query=" + text;    // JSON 결과
	        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // XML 결과


	        Map<String, String> requestHeaders = new HashMap<>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        String responseBody = get(apiURL,requestHeaders);

	        // 정보 출력하는 부분
	        System.out.println(responseBody);
	        
	        // String을 JSON으로 바꾸어주자
	        // lib에 json-simple 추가해서 JSONParser import 했음
	        JSONParser jsonParser = new JSONParser();
	        JSONObject jsonObject = null;
			try {
				jsonObject = (JSONObject)jsonParser.parse(responseBody);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			JSONArray bookInfoResult = (JSONArray)jsonObject.get("items");
			// JSONArray bookInfoResult 에서 하나씩 JSONObject로 변환해서 프린트하기
	        JSONObject jsonObj = (JSONObject)bookInfoResult.get(0);
	        
	        System.out.println((String)jsonObj.get("isbn")); 
	        System.out.println((String)jsonObj.get("title")); 
	        System.out.println((String)jsonObj.get("author")); 
	        System.out.println((String)jsonObj.get("publisher")); 
	        System.out.println((String)jsonObj.get("pubdate")); 
	        System.out.println((String)jsonObj.get("description"));
	        System.out.println((String)jsonObj.get("image"));
			
	        
	        
	    }


	    private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }


	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 오류 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }


	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }


	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);


	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();


	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                // 보기 편하게 개행 추가했음
	            	responseBody.append(line+"\n");
	            }


	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
	        }
	    }
	}
