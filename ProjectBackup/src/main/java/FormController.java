
import java.io.IOException;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FormController
 */
@WebServlet("/FormController")
public class FormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FormController() {
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
	 * @throws IOException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String Formcreator="Rohit";
		try {
			Formcreator = request.getParameter("formcreator");
			String Formname = request.getParameter("formname");
			String Formbody = request.getParameter("formbody");
			File file = new File(
					"C:\\Rohit's Project\\ProjectBackup\\src\\main\\webapp\\Quizes\\" + Formname + ".jsp");
			if (file.exists()) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('File already exists');");
				out.println("location='CreationOfQuiz.jsp';");
				out.println("</script>");
			} else {
				FileWriter fileWriter = new FileWriter(file);
				PrintWriter printWriter = new PrintWriter(fileWriter);
				printWriter.println(Formbody);
				printWriter.close();
				fileWriter.close();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Form Created Successfully');");
				out.println("location='index.html';");
				out.println("</script>");
				fileWriter.close();
				printWriter.close();
				
				Form form = new Form(Formcreator, Formname);
				Boolean flag = FormDAO.insertForm(form);
			}
			
			out.close();
		} catch (IOException e) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('There was an error while creating the form');");
			out.println("location='index.html';");
			out.println("</script>");
		}
	}

}
