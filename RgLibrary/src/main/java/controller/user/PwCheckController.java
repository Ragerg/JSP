package controller.user;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.user.MemberDAO;
import biz.user.MemberVO;
import controller.Controller;

public class PwCheckController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
	
		String id = ((MemberVO)session.getAttribute("member")).getId();
		String pw = request.getParameter("pw2");
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		
		MemberDAO dao = new MemberDAO();
		MemberVO member = dao.logIn(vo);
		
		if(member != null) {
			return "/jsp/user/myInfoPage.jsp";
		} else {
			return "/jsp/user/pwCheckError.jsp";
		}
	}
	
}
