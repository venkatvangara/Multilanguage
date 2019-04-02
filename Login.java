package fr.esigelec.jee;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String usrName=request.getParameter("username");
		String pwd=request.getParameter("password");
		String message="";
		
		Dao data=new Dao();
		if(usrName.equals("")||pwd.equals("")) {
			message="login or password cannot be empty";
			HttpSession UserInformation = request.getSession(); 
			UserInformation.setAttribute("message", message);
			response.sendRedirect("LoginForm.jsp");
		} else
			try {
				if(data.validateUserCredentials(usrName, pwd)) {
					HttpSession UserInformation = request.getSession(); 
					UserInformation.setAttribute("UserName", usrName);
					response.sendRedirect("HelloWorldMultiLanguage.jsp");
				}
				else {
					message="Invalid login or password";
					HttpSession UserInformation = request.getSession(); 
					UserInformation.setAttribute("message", message);
					response.sendRedirect("LoginForm.jsp");
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
	}

}
