package controller.board;

import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class BoardListController implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
    	try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

        List<BoardVO> boardList = new BoardDAO().getBoardList();

        request.setAttribute("boardList", boardList);

        return "/jsp/board/boardList.jsp";
    }
}
