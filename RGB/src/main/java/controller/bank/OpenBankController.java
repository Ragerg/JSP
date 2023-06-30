package controller.bank;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.bank.BankDAO;
import biz.bank.BankVO;
import biz.user.UserVO;
import controller.Controller;

public class OpenBankController implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            return "loginPage.do";
        }
        UserVO user = (UserVO) session.getAttribute("user");

        List<BankVO> accountList = new BankDAO().openBank(user);

     // 총 잔액 계산
        int totalBalance = 0;
        for (BankVO account : accountList) {
            totalBalance += account.getAccount_balance();
        }

        // 총 잔액을 request에 추가
        request.setAttribute("totalBalance", totalBalance);
        request.setAttribute("accountList", accountList);

        System.out.println(accountList);

        return "/jsp/bank/openBank.jsp";
        
//        String msg = "";
//        if (result > 0) {
//            msg = "타은행 계좌가 연결되었습니다.";
//            request.setAttribute("msg", msg);
//            request.setAttribute("url", "myAccount.do");
//            return "/jsp/alert_success.jsp";
//        } else {
//            msg = "타은행 계좌가 없습니다.";
//            request.setAttribute("msg", msg);
//            request.setAttribute("url", "myAccount.do");
//        }
//        return "/jsp/alert_warning.jsp";

	
	
	
	}

}

