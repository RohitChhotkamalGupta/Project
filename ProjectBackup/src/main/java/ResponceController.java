
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.ResultSet;

/**
 * Servlet implementation class ResponceController
 */
@WebServlet("/ResponceController")
public class ResponceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResponceController() {
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
		PrintWriter out = response.getWriter();
		String formname = request.getParameter("formname");
		String quizattempter = request.getParameter("quizattempter");
		String formcreator = null;
		String responce = request.getParameter("answers");
		String marks = "Na";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = null;
			String DbUsername = "root";
			String DbPassword = "";
			String DbUrl = "jdbc:mysql://localhost:3306/typroject";
			con = DriverManager.getConnection(DbUrl, DbUsername, DbPassword);
			String sql ="select formcreater from formdetails where formname='"+formname+"'";
			System.out.println(sql);
			Statement statement = con.createStatement();
			ResultSet resultset = statement.executeQuery(sql);
			resultset.next();
			formcreator = resultset.getString("formcreater");
			sql = "insert into responce values('"+formname+"','"+formcreator+"','"+quizattempter+"','"+responce+"','"+marks+"')";
			int flag = statement.executeUpdate(sql);
			if(flag==1) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Record Saved');");
				out.println("location='index.html';");
				out.println("</script>");
			}else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('error occured in saving record');");
				out.println("location='index.html';");
				out.println("</script>");
			}
		} catch (SQLIntegrityConstraintViolationException e) {
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
