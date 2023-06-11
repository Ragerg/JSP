package controller.rental;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.rental.RentalDAO;
import biz.user.MemberVO;
import controller.Controller;

public class RentalBookController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        MemberVO member = (MemberVO) session.getAttribute("member");
        String id = member.getId();
        String isbn = request.getParameter("isbn");

        new RentalDAO().insertRental(id, isbn);

        return "/jsp/rental/rental.jsp";
    }
}
