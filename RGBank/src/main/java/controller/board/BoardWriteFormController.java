package controller.board;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class BoardWriteFormController implements Controller {
  @Override
  public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	  try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
      return "/jsp/board/boardWriteForm.jsp";
  }
}
