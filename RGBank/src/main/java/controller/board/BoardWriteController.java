package controller.board;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class BoardWriteController implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
    	try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String content = request.getParameter("content");
        boolean isPublic = Boolean.parseBoolean(request.getParameter("isPublic"));

        BoardVO board = new BoardVO();
        board.setTitle(title);
        board.setAuthor(author);
        board.setContent(content);
        board.setPublic(isPublic);

        int result = new BoardDAO().createBoard(board);
        if (result == 1) {
        	request.setAttribute("msg", "게시글이 성공적으로 등록되었습니다.");
            request.setAttribute("url", "boardList.do");
            return "/jsp/alert.jsp";
        } else {
        	request.setAttribute("msg", "게시글 등록에 실패하였습니다.");
            request.setAttribute("url", "boardWrite.do");
            return "/jsp/alert.jsp";
        }
    }
}
