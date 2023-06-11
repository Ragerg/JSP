package controller;

import java.util.HashMap;
import java.util.Map;

import controller.book.InputBookController;
import controller.book.InsertBookController;
import controller.book.InsertBookPageController;
import controller.book.SearchBookController;
import controller.book.SearchBookPageController;
import controller.book.DeleteBookController;
import controller.book.DeleteBookPageController;
import controller.manager.ManagerPageController;
import controller.rental.RenewalController;
import controller.rental.RentalBookController;
import controller.rental.RentalListController;
import controller.rental.ReturnRentalController;
import controller.user.IdCheckController;
import controller.user.JoinController;
import controller.user.JoinPageController;
import controller.user.LoginPageController;
import controller.user.LoginProcessController;
import controller.user.LogoutController;
import controller.user.MyInfoController;
import controller.user.MyPageController;
import controller.user.PwCheckController;
import controller.user.PwCheckPageController;
import controller.user.MyInfoPageController;

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

		mappings.put("/insertBookPage.do", new InsertBookPageController());
		mappings.put("/inputBook.do", new InputBookController());
		mappings.put("/insertBook.do", new InsertBookController());
		mappings.put("/deleteBookPage.do", new DeleteBookPageController());
		mappings.put("/deleteBook.do", new DeleteBookController());

		mappings.put("/managerPage.do", new ManagerPageController());
		mappings.put("/searchBookPage.do", new SearchBookPageController());
		mappings.put("/searchBook.do", new SearchBookController());
		
		mappings.put("/myPage.do", new MyPageController());
		mappings.put("/pwCheckPage.do", new PwCheckPageController());
		mappings.put("/pwCheck.do", new PwCheckController());
		mappings.put("/myInfoPage.do", new MyInfoPageController());
		mappings.put("/myInfo.do", new MyInfoController());
		
		mappings.put("/rentalBook.do", new RentalBookController());
		mappings.put("/rentalList.do", new RentalListController());
		mappings.put("/renewal.do", new RenewalController());
		mappings.put("/returnRental.do", new ReturnRentalController());

	}

	public Controller getController(String path) {
		System.out.println(path);
		return mappings.get(path);
	}

}
