import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.Statement;

public class FormDAO {
	
	Form form;
		
	public FormDAO(Form form) {
		super();
		this.form = form;
	}


	public static Connection connection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = null;

		String DbUsername = "root";
		String DbPassword = "";
		String DbUrl = "jdbc:mysql://localhost:3306/typroject";

		con = DriverManager.getConnection(DbUrl, DbUsername, DbPassword);
		System.out.println("Connection created successfully");
		return con;
	}
	
	public static boolean insertForm(Form form) {
		boolean flag=false;
		String Formcreator = form.getFormcreator();
		String Formname = form.getFormname();
		System.out.println(Formcreator+" "+Formname);
		String sql = "insert into formdetails values('"+Formcreator+"','"+Formname+"')";
		try {
			Connection connection = FormDAO.connection();
			Statement statement = connection.createStatement();
			int result = statement.executeUpdate(sql);
			if(result!=0) {
				flag=true;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}
}
