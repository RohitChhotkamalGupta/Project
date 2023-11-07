

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginControllerForCreatingQuiz
 */
@WebServlet("/LoginControllerForCreatingQuiz")
public class LoginControllerForCreatingQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControllerForCreatingQuiz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		boolean ValidateUser = UserDAO.validateUser(username, password); 
		if(ValidateUser) {				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Logged in successfully.');");
				out.println("location='CreationOfQuiz.jsp?formcreator="+username+"';");
				out.println("</script>");
				out.close();
		}else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Error occured while login.');");
			out.println("location='LoginForCreatingQuiz.jsp';");
			out.println("</script>");
			out.close();
		}
	}

}
