package controller.bank;



import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.bank.*;
import biz.board.BoardDAO;
import biz.board.BoardVO;
import biz.user.UserVO;
import controller.Controller;

public class CreateAccountController implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
        }
		String account_no = request.getParameter("account_no");
		String bank_code = request.getParameter("bank_code");
		String pd_cd = request.getParameter("pd_cd");
		String account_pw = request.getParameter("account_pw");
		Long account_balance = Long.parseLong(request.getParameter("account_balance"));
		String account_name = request.getParameter("account_name");

        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        BankVO bank = new BankVO();
        bank.setAccount_no(account_no);
        bank.setBank_code(bank_code);
        bank.setPd_cd(pd_cd);
        bank.setAccount_pw(account_pw);
        bank.setAccount_balance(account_balance);
        bank.setAccount_name(account_name);
        bank.setId(user.getUser_id());
        bank.setMember_name(user.getUser_name());
        int result = new BankDAO().insertAccount(bank);

        String msg = "";
        if (result == 1) {
            msg = "계좌가 개설되었습니다.";
            request.setAttribute("msg", msg);
            request.setAttribute("url", "myAccount.do");
            return "/jsp/alert_success.jsp";
        } else {
            msg = "계좌 개설에 실패했습니다. 관리자에게 문의해 주세요.";
            request.setAttribute("msg", msg);
            request.setAttribute("url", "myAccount.do");
        }
        return "/jsp/alert_warning.jsp";

	}

}
