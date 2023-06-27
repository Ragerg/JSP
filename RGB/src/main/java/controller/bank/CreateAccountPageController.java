package controller.bank;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.bank.BankDAO;
import biz.bank.ProductDAO;
import biz.bank.ProductVO;
import controller.Controller;

public class CreateAccountPageController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

    	  String product_cd = request.getParameter("product_cd");
    	  ProductVO product = new ProductDAO().getProduct(product_cd);

          Random random = new Random();

          String account_no = "";
          do {
              int no = random.nextInt(999999999);
              account_no = String.format("%d%09d", 999, no);
              System.out.println(account_no);
          } while (new BankDAO().checkAccount(account_no));

          request.setAttribute("product", product);
          request.setAttribute("account_no", account_no);

        return "/jsp/bank/createAccount.jsp";
    }

}
