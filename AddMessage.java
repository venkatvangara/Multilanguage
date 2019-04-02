package fr.esigelec.jee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddMessage
 */
@WebServlet("/AddMessage")
public class AddMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String index = "";
	String message = "";
	HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddMessage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		index = request.getParameter("langIndex");
		message = request.getParameter("lanMessage");
		session = request.getSession();

		System.out.println("Index" + index + "Message" + message);
		if ((index != "") && (message != "")) {
			System.out.println("Inside IF");

			Dao data = new Dao();
			if (data.addMessage(index, message)) {
				System.out.println("Data Added");
				session.setAttribute("result", "success");
				response.sendRedirect("AddMessage.jsp");
			} else {
				session.setAttribute("result", "database failure");
				response.sendRedirect("AddMessage.jsp");
			}

		} else {
			session.setAttribute("result", "Mandatory fields missing");
			response.sendRedirect("AddMessage.jsp");
		}

	}

}
