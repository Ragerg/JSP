package controller.bank;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.bank.BankDAO;
import biz.bank.BankVO;
import biz.user.UserVO;
import controller.Controller;

public class MyAccountController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            return "loginPage.do";
        }
        UserVO user = (UserVO) session.getAttribute("user");
        String id = user.getUser_id();

        List<BankVO> accountList = new BankDAO().getAccountList(id);

     // 총 잔액 계산
        int totalBalance = 0;
        for (BankVO account : accountList) {
            totalBalance += account.getAccount_balance();
        }

        // 총 잔액을 request에 추가
        request.setAttribute("totalBalance", totalBalance);
        request.setAttribute("accountList", accountList);

        System.out.println(accountList);

        return "/jsp/bank/myAccount.jsp";

    }
}