package controller.board;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class BoardEditController implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
    	try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
        int boardId = Integer.parseInt(request.getParameter("boardId"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String author = request.getParameter("author");
        
        BoardDAO boardDAO = new BoardDAO();
        BoardVO board = boardDAO.readBoard(boardId);
        board.setTitle(title);
        board.setContent(content);
        board.setAuthor(author);
        
        boardDAO.updateBoard(board);
        
        return "redirect:boardList.do";
    }
}
