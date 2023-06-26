package controller.board;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import biz.board.BoardDAO;
import controller.Controller;

public class BoardDeleteController implements Controller {
  @Override
  public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	  try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
      int boardId = Integer.parseInt(request.getParameter("boardId"));
      
      BoardDAO boardDAO = new BoardDAO();
      boardDAO.deleteBoard(boardId);
      
      return "redirect:boardList.do";
  }
}
