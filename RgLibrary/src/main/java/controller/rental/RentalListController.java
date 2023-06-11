package controller.rental;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.rental.RentalDAO;
import biz.rental.RentalVO;
import biz.user.MemberVO;
import controller.Controller;

public class RentalListController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

    	HttpSession session = request.getSession();
        MemberVO member = (MemberVO) session.getAttribute("member");

        String url = "";
//        if (member == null) {
//            request.setAttribute("msg", "로그인이 필요합니다.");
//            request.setAttribute("url", "login.do");
//            url = "/jsp/alert.jsp";
//        } else {
            String id = member.getId();

            RentalDAO dao = new RentalDAO();
            List<RentalVO> rentalList = dao.getRentalList(id);

            request.setAttribute("rentalList", rentalList);
            url = "/jsp/user/myPage.jsp";
//        }
        return url;
    }
}