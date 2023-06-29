package controller.bank;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.bank.BankDAO;
import biz.bank.BankVO;
import biz.bank.ProductDAO;
import biz.bank.ProductVO;
import biz.user.UserVO;
import controller.Controller;

public class TransPageController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
          
          String account_no = request.getParameter("account_no");
          
          request.setAttribute("account_no", account_no);
          
          HttpSession session = request.getSession();
          if (session.getAttribute("user") == null) {
              return "loginPage.do";
          }
          UserVO user = (UserVO) session.getAttribute("user");
          String id = user.getUser_id();
          List<BankVO> accountList = new BankDAO().getAccountList(id);
          request.setAttribute("accountList", accountList);
          
          BankVO accountVo = new BankDAO().getAccount(account_no);
          request.setAttribute("accountVo", accountVo);
          

    	
        return "/jsp/bank/trans.jsp";
    }

}
