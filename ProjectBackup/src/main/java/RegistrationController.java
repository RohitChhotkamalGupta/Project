
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrationController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		User user = new User(name, email, username, password);
		UserDAO userDAO = new UserDAO(user);
		int InsertStatus = 0 ;
		try {
			InsertStatus = userDAO.insertUser();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		if (InsertStatus==1) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('User created successfully');");
			out.println("location='index.html';");
			out.println("</script>");
			out.close();
		} else if(InsertStatus == 2) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('User already exists');");
			out.println("location='Registration.jsp';");
			out.println("</script>");
			out.close();
		}else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('There was an error while creating user');");
			out.println("location='Registration.jsp';");
			out.println("</script>");
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
