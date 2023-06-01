package controller.board;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

//게시판 본문
public class GetBoardController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//getBoardList.jsp 에서 getboard.do?seq=${ board.seq }" 로 보낸 seq 파라미터 받아오기
		String seq = request.getParameter("seq");
		
		// 받아온 seq를 넣은 BoardVO 만들기 
		BoardVO vo = new BoardVO();
		// seq는 String형이니까 형변환 해주기 
		vo.setSeq(Integer.parseInt(seq));
		
		BoardDAO dao = new BoardDAO();
		// seq가 들어있는 vo를 보내서 새로운 vo board 받아오기
		BoardVO board = dao.getBoard(vo);
		
		request.setAttribute("board", board);
		
		return "getBoard.jsp";
	}
		
}
