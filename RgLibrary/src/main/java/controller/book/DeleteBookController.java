package controller.book;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.book.BookDAO;
import controller.Controller;

public class DeleteBookController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        int regNo = Integer.parseInt(request.getParameter("regNo"));

        new BookDAO().deleteBook(regNo);

        return "/jsp/book/deleteBook.jsp";

    }
}