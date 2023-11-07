

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdatedeMarksController
 */
@WebServlet("/UpdatedeMarksController")
public class UpdatedeMarksController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatedeMarksController() {
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
		String formname=request.getParameter("formname");
		String quizattempter=request.getParameter("quizattempter");
		String newmarks = request.getParameter("marks");
		String formcreator = request.getParameter("formcreator");
		//System.out.println(formname+" "+quizattempter+" "+newmarks);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/typroject","root","");
			String sql = "update responce set marks='"+newmarks+"' where formname='"+formname+"' AND quizattempter='"+quizattempter+"'";
			Statement statement = connection.createStatement();
			int flag=statement.executeUpdate(sql);
			if(flag==1) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Marke Updated');");
				out.println("location='ExistingFormsAndResponces.jsp?formcreator="+formcreator+"';");
				out.println("</script>");
			}else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Error occured while updating marks');");
				out.println("location='ExistingFormsAndResponces.jsp?formcreator="+formcreator+"';");
				out.println("</script>");
			}
		}catch (Exception e) {
		}
	}

}
