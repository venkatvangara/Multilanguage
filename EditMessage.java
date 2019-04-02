package fr.esigelec.jee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EditMessage
 */
@WebServlet("/EditMessage")
public class EditMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
    HttpSession session;
    Dao data=new Dao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String language=request.getParameter("langtoEdit");
		String message=request.getParameter("lanMessage");
		session=request.getSession();
		if(!language.equals("--Select Language to Edit--")) {
			if(data.updateMessage(language, message)) {
				session.setAttribute("update", "success");
				response.sendRedirect("EditMessage.jsp");
			}else {
				session.setAttribute("update", "failure");
				response.sendRedirect("EditMessage.jsp");
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String language=request.getParameter("langtoEdit");
		String message=request.getParameter("lanMessage");
		session=request.getSession();
		if(!language.equals("--Select Language to Edit--")) {
			if(data.updateMessage(language, message)) {
				session.setAttribute("update", "success");
				response.sendRedirect("EditMessage.jsp");
			}else {
				session.setAttribute("update", "failure");
				response.sendRedirect("EditMessage.jsp");
			}
		}
	}

}
