package controller.bank;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.bank.BankDAO;
import biz.bank.BankVO;
import biz.bank.TransactionDAO;
import biz.bank.TransactionVO;
import biz.user.UserVO;
import controller.Controller;

public class TransactionController implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
        }
		
		String fromAccount = request.getParameter("fromAccount");
		String bank_code = request.getParameter("bank_code");
		String toAccount = request.getParameter("toAccount");
		Long trans_amount = Long.parseLong(request.getParameter("trans_amount"));
		String fromName = request.getParameter("fromName");
		String toName = request.getParameter("toName");
		
		HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");
        
        TransactionVO transD = new TransactionVO();
        transD.setBank_cd(bank_code);
        transD.setTrans_name(fromName);
        transD.setTrans_type("D");
        transD.setTrans_amount(trans_amount);
        transD.setTrans_Account(toAccount);
        
        TransactionVO transW = new TransactionVO();
        transW.setBank_cd("999");
        transW.setTrans_name(toName);
        transW.setTrans_type("W");
        transW.setTrans_amount(trans_amount);
        transW.setTrans_Account(fromAccount);
        
        int result = new TransactionDAO().Transaction(transD, transW);
        
        String msg = "";
        if (result == 1) {
            msg = "계좌이체 성공";
            request.setAttribute("msg", msg);
            request.setAttribute("url", "myAccount.do");
            return "/jsp/alert_success.jsp";
        } else {
            msg = "계좌이체에 실패했습니다. 관리자에게 문의해 주세요.";
            request.setAttribute("msg", msg);
            request.setAttribute("url", "myAccount.do");
        }
        return "/jsp/alert_warning.jsp";
		
	}
}
