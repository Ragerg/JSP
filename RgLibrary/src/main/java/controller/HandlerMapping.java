package controller;

import java.util.HashMap;
import java.util.Map;

import controller.user.IdCheckController;
import controller.user.JoinController;
import controller.user.JoinPageController;
import controller.user.LoginPageController;
import controller.user.LoginProcessController;
import controller.user.LogoutController;

public class HandlerMapping {
	private Map<String, Controller> mappings;
	
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		mappings.put("/main.do", new MainController());
		mappings.put("/joinPage.do", new JoinPageController());
		mappings.put("/join.do", new JoinController());
		mappings.put("/idCheck.do", new IdCheckController());
		mappings.put("/loginPage.do", new LoginPageController());
		mappings.put("/loginProcess.do", new LoginProcessController());
		mappings.put("/logout.do", new LogoutController());
	}
	
	public Controller getController(String path) {
		System.out.println(path);
		return mappings.get(path);
	}

}
