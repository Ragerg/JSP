package controller.user;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.user.MemberDAO;
import biz.user.MemberVO;
import controller.Controller;

public class MyInfoController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		 HttpSession session = request.getSession();
	        String id = ((MemberVO) session.getAttribute("member")).getId();
	        String newPw = request.getParameter("newPw");
	        String phone = request.getParameter("phone");

	        MemberDAO dao = new MemberDAO();

	        int result = dao.updateUser(id, newPw, phone);

	        if(result == 1) {
	        	return "/jsp/user/myInfo.jsp";
	        } else 
	        return "/jsp/user/myInfoError.jsp";
	    }
	}
