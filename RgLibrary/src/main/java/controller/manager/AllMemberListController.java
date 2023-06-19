package controller.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.user.MemberDAO;
import biz.user.MemberVO;
import controller.Controller;

public class AllMemberListController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

        MemberDAO dao = new MemberDAO();

        List<MemberVO> memberList = dao.allMemberList();
        request.setAttribute("memberList", memberList);

        return "/jsp/manager/allMemberList.jsp";
    }
}
