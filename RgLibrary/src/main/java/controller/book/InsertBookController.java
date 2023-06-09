package controller.book;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.book.BookDAO;
import biz.book.BookVO;
import controller.Controller;

public class InsertBookController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String isbn = request.getParameter("isbn");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String pubdate = request.getParameter("pubdate");
		String description = request.getParameter("description");
		String image = request.getParameter("image");

		BookVO vo = new BookVO();
		vo.setIsbn(isbn);
		vo.setTitle(title);
		vo.setAuthor(author);
		vo.setPublisher(publisher);
		vo.setPubdate(pubdate);
		vo.setDescription(description);
		vo.setImage(image);

		BookDAO dao = new BookDAO();
		dao.insertBook(vo);

		return "jsp/book/insertBookPage.jsp";
	}

}
