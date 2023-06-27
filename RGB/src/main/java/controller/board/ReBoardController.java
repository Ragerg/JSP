package controller.board;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.board.BoardVO;
import biz.user.UserVO;
import controller.Controller;

public class ReBoardController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String title = request.getParameter("title");
        int b_no = Integer.parseInt(request.getParameter("b_no"));

        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");
        
        BoardVO board = new BoardVO();
        board.setTitle(title);
        board.setB_no(b_no);
        board.setUser_id(user.getUser_id());
        board.setName(user.getUser_name());
        request.setAttribute("board", board);
        System.out.println(board);

        return "/jsp/board/reBoard.jsp";
    }

}
