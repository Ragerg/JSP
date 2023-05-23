package ex5_cookie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CookieTestServlet2
 */
@WebServlet("/CookieTestServlet2")
public class CookieTestServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookieTestServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// �Է� ��� ���ڵ� ���ڵ� ���ڼ� ����
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=EUC-KR");
		
		// ��� HTML ���� ����� ���� out �ν��Ͻ� ����
		PrintWriter out =  response.getWriter();
		
		// �������κ��� ��Ű ��������
		Cookie[] cookies = request.getCookies();
		// ��Ű�� �ִ��� Ȯ�� �� ��Ű�� ������ ��Ű �� ���
		for(int i = 0; cookies != null && i < cookies.length; i++) {
			out.println("cookie : " + cookies[i].getName() + " : " + cookies[i].getValue() + "<br/>");
		}

		// name�� value �Է� �޴� html �� ����
		out.println("<form method = 'post' action = 'CookieTestServlet2'>"); // ���� �����Ҷ� PostŸ������ ������
		out.println("name<input type='text' name = 'name'/>");
		out.println("value<input type='text' name = 'value'/>");
		out.println("<input type='submit'/>");
		out.println("</fomr>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ������ POST�� ��û�� ���� 
		// request������ name, value ����
		String name = request.getParameter("name"); 
		String value = request.getParameter("value");

		// ��Ű�� ���� 
		Cookie c = new Cookie(name, value);
		response.addCookie(c);
		
		// ������ doGet���� �����̷���
		response.sendRedirect("CookieTestServlet2");
	} 

}
