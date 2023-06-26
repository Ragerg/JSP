package controller.board;

	import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import biz.board.BoardDAO;
	import biz.board.BoardVO;
import controller.Controller;

	public class BoardReadController implements Controller {
	    @Override
	    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	    	try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
	        int boardId = Integer.parseInt(request.getParameter("boardId"));

	        BoardVO board = new BoardDAO().readBoard(boardId);

	        request.setAttribute("board", board);

	        return "/jsp/board/boardRead.jsp";
	    }
	}
