package controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.rental.RentalDAO;
import biz.rental.RentalVO;
import biz.user.MemberVO;
import controller.Controller;

public class MyPageController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String id = ((MemberVO)session.getAttribute("member")).getId();
		
		String url = "";
        if (id == null) {
            url = "/jsp/user/myPageError";
        } else {
    		
    		RentalDAO dao = new RentalDAO();
    		List<RentalVO> rentalList = dao.getRentalList(id);

    		request.setAttribute("rentalList", rentalList);
            url = "/jsp/user/myPage.jsp";
        }
        return url;
		
	}

}
