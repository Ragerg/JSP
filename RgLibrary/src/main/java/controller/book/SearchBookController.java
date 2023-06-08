package controller.book;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.book.BookDAO;
import biz.book.BookVO;
import controller.Controller;

public class SearchBookController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String searchItem = request.getParameter("searchItem");
        String searchText = request.getParameter("searchText");

        BookDAO dao = new BookDAO();
        List<BookVO> bookList = dao.searchBookList(searchItem, searchText);

        request.setAttribute("bookList", bookList);

        return "/jsp/book/searchBookPage.jsp";
	}

}
