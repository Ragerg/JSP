package controller.board;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class SearchBoardController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String writer  = request.getParameter("writer");
		BoardVO vo = new BoardVO();
		vo.setWriter(writer);
		
		BoardDAO dao = new BoardDAO();
		List<BoardVO> boardList = dao.searchBoardList(vo);
		
		request.setAttribute("boardList", boardList);
		
		return "getBoardList.jsp";
	}
		
}
