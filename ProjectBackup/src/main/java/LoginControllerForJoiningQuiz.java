

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginControllerForJoiningQuiz
 */
@WebServlet("/LoginControllerForJoiningQuiz")
public class LoginControllerForJoiningQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControllerForJoiningQuiz() {
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
		String formname = request.getParameter("formname");
		boolean ifUserExists = UserDAO.ifUsernmaeExists(username); 
		if(ifUserExists) {
			boolean ValidateUser = UserDAO.validateUser(username, password);
			System.out.println(ValidateUser);
			if(ValidateUser) {
				String filePath = "C:\\Rohit's Project\\ProjectBackup\\src\\main\\webapp\\Quizes\\"+formname+".jsp";
				File file = new File(filePath);
				System.out.println(file.exists());
				if (file.exists()) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Logged in successfully.');");
					out.println("location='./Quizes/"+formname+".jsp?quizattempter="+username+"';");
					//System.out.println("D:\\003TyProject\\OnlineQuizApplication\\src\\main\\webapp\\Quizes\\"+formname+".html");
					out.println("</script>");
					out.close();
		        } else {
		        	out.println("<script type=\"text/javascript\">");
					out.println("alert('Form Does not exists');");
					out.println("location='LoginForJoiningQuiz.jsp';");
					out.println("</script>");
					out.close();
		        }				
			}else if(ValidateUser){
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Password doesn't match');");
				out.println("location='LoginForJoiningQuiz.jsp';");
				out.println("</script>");
				out.close();
			}
		}else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('User does not exists.');");
			out.println("location='LoginForJoiningQuiz.jsp';");
			out.println("</script>");
			out.close();
		}
	}

}
