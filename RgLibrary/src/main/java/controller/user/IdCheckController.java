package controller.user;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.user.MemberDAO;
import controller.Controller;

public class IdCheckController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	
		String id = request.getParameter("id");
        int idCheck = new MemberDAO().idCheck(id);
        
        request.setAttribute("idCheck", idCheck);
        return "/jsp/login/idCheck.jsp";
    }
	
}
