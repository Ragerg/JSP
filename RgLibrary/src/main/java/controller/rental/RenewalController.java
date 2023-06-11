package controller.rental;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.rental.RentalDAO;
import controller.Controller;

public class RenewalController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

        int rentNo = Integer.parseInt(request.getParameter("rentNo"));

        
        int result = new RentalDAO().renewal(rentNo);

        if(result == 1) {
        	return "/jsp/rental/renewal.jsp";
        } else 
        	return "/jsp/rental/renewalError.jsp";
        
    }
}