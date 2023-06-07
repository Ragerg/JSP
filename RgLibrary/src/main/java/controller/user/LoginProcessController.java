package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.user.MemberDAO;
import biz.user.MemberVO;
import controller.Controller;

public class LoginProcessController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		
		MemberDAO dao = new MemberDAO();
		MemberVO member = dao.logIn(vo);
		
		if(member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			return "main.do";
		} else {
			return "/jsp/login/loginError.jsp";
		}
	}
}
