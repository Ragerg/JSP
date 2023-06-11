package controller.rental;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.rental.RentalDAO;
import controller.Controller;

public class ReturnRentalController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

        int regNo = Integer.parseInt(request.getParameter("regNo"));

        int result = new RentalDAO().returnRental(regNo);
        
        if(result == 1) {
        	return "/jsp/rental/returnRental.jsp";
        } else 
        	return "/jsp/rental/returnRentalError.jsp";
    }
}