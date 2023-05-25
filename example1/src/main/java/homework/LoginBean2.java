package homework;

public class LoginBean2 {
	private String id;
	private String pw;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public boolean dbCheck() {
		if(id.equals("admin01") && pw.equals("9999")) {
			return true;
		} else {
			return false;
		}
	}

}
