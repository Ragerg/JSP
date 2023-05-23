package homework;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class QueryServlet
 */
@WebServlet("/Login")
public class ArithmeticServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArithmeticServlet2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if(!cookie.getName().equals("count"))
					out.print("<h3>" + cookie.getValue() + "</h3>");
			}
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("arithmetic2.html");
		rd.include(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				
				//���� ���
				int num1 = Integer.parseInt(request.getParameter("num1"));
				int num2 = Integer.parseInt(request.getParameter("num2"));
				String operator = request.getParameter("operator");
				double result = 0;

				switch (operator) {
					case "+":
						result = num1 + num2;
						break;
					case "-":
						result = num1 - num2;
						break;
					case "×":
						result = num1 * num2;
						break;
					case "÷":
						result = num1 / (double)num2;
						break;
				}


				
				// ��Ű�� ����
				int cnt = 0;
				Cookie[] cookies = request.getCookies();
				for(int i = 0; cookies != null && i < cookies.length; i++) {
					if(cookies[i].getName().equals("count")) {
						cnt = Integer.parseInt(cookies[i].getValue());
						break;
					}
				}
				
				cnt++;
				Cookie c2 = new Cookie("count", cnt + "");
				response.addCookie(c2);
				Cookie c = new Cookie(cnt+ "" , num1 + operator + num2 + "=" + result);
				response.addCookie(c);
				
				// ���� doGet���� �����̷���
				response.sendRedirect("ArithmeticServlet2");
	}

}
