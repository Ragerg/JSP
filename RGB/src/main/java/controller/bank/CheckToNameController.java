package controller.bank;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.bank.TransactionDAO;
import controller.Controller;

public class CheckToNameController  implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
        }
		
		String toAccount = request.getParameter("toAccount");
        String bank_code = request.getParameter("bank_code");

        String result = new TransactionDAO().checkAccount(toAccount, bank_code);
        request.setAttribute("result", result);

        return "/jsp/check.jsp";

	
	
	
	}

}
