package fr.esigelec.jee;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JTextField;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String userName = "";
	String password = "";
	String cnfPassword = "";
	String email = "";
	HttpSession session;
	String result;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		session=request.getSession();
		userName = request.getParameter("username");
		password = request.getParameter("password");
		cnfPassword = request.getParameter("cnfpassword");
		email = request.getParameter("email");

        if(validateUser(userName, password, cnfPassword, email)) {
        	Dao data=new Dao();

        	if(data.checkExistingUserName(userName).equals("success")) {
        	result=data.addUser(userName, cnfPassword, email);
        	session.setAttribute("Result", result);
        	response.sendRedirect("LoginForm.jsp");
        	}
        	else {
        		result="UserName Exists";
        		session.setAttribute("Result", result);
            	response.sendRedirect("LoginForm.jsp");
        	}
        }
        else {
        	
        	response.sendRedirect("NewUser.jsp");	
        }
		

	}

	public boolean validateUser(String userName, String password, String cnfPassword, String email) {
		boolean flag = false;
		if (!(userName.equals(null) || userName.equals(""))) {
			if (!(password.equals(null) || password.equals(""))) {
				if (password.equals(cnfPassword)) {
                  
					flag = true;

				} else {
					session.setAttribute("messageValidate", "Passwords Do not match");
				}
			} else {
				session.setAttribute("messageValidate", "Passwords cannot be null");
			}
		} else {
			session.setAttribute("messageValidate", "UserName cannot be null");
		}

		return flag;

	}

	public boolean emailCheck(String emailID) {
		String str = "";
		String emailid;
		boolean result = true;
		emailid = emailID;

		if (emailid.equalsIgnoreCase(str)) {
			result = false;
		} else {
			Pattern p = Pattern.compile("[a-zA-Z0-9_.]*@[a-zA-Z]*.[a-zA-Z]*");
			Matcher m = p.matcher(emailid);
			boolean bm = m.matches();

			if (bm == true) {
				result = true;

			} else {
				result = false;
			}
		}
		return result;
	}

}
