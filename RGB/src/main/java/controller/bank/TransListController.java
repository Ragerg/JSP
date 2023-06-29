package controller.bank;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.bank.TransactionDAO;
import biz.bank.TransactionVO;
import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class TransListController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
    	
    	try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
        }
    	
    	String account_no = request.getParameter("account_no");
    	String account_name = request.getParameter("account_name");
    	
        TransactionDAO transDAO = new TransactionDAO();
        List<TransactionVO> transList = transDAO.getTransList(account_no);

        request.setAttribute("transList", transList);
        request.setAttribute("account_no", account_no);
        request.setAttribute("account_name", account_name);
        
        return "/jsp/bank/transList.jsp";
    }

}
