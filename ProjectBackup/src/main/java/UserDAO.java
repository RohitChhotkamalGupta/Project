import java.sql.*;

public class UserDAO {
	User user;

	public UserDAO(User user) {
		this.user = user;
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

	public static User getUserByUsername(String Username) {
		User user_ = null;
		String query = "select * from userdetails where username = '" + Username + "'";
		Connection con = null;
		try {
			String name = null;
			String email = null;
			String username = null;
			String password = null;
			con = UserDAO.connection();
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery(query);
			while (resultSet.next()) {
				name = resultSet.getString("name");
				email = resultSet.getString("email");
				username = resultSet.getString("username");
				password = resultSet.getString("password");
			}
			resultSet.close();
			statement.close();
			con.close();
			System.out.println("connection closed successfully");
			user_ = new User(name, email, username, password);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return user_;

	}

	public int insertUser() throws Exception {
		int flag = 0;

		String name = user.getName();
		String email = user.getEmail();
		String username = user.getUsername();

		String givenPassword = user.getPassword();
		String encryptedPassword = PasswordEncryptionAndDecryption.encrypt(givenPassword);

		String query = "insert into userdetails values('" + name + "','" + email + "','" + username + "','"
				+ encryptedPassword + "')";
		Connection con;
		try {
			con = UserDAO.connection();
			Statement statement = con.createStatement();
			statement.executeUpdate(query);

			statement.close();
			con.close();
			System.out.println("connection closed successfully");
			flag = 1;

		} catch (SQLIntegrityConstraintViolationException e) {
			flag = 2;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;

	}

	public static boolean ifUsernmaeExists(String uname) {
		boolean flag = false;
		String username = uname;
		String query = "select username from userdetails where username = '" + username + "'";
		try {
			Connection con = UserDAO.connection();
			Statement st = con.createStatement();
			ResultSet resultSet = st.executeQuery(query);
			if (resultSet.next()) {
				flag = true;
			} else {
				flag = false;
			}

			resultSet.close();
			st.close();
			con.close();
			System.out.println("connection closed successfully");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		System.out.println(flag);
		return flag;
	}

	public static boolean validateUser(String username, String GiverPassword) {
		boolean flag = false;
		String password = PasswordEncryptionAndDecryption.encrypt(GiverPassword);
		String query = "select * from userdetails where username = '" + username + "' AND password='"+password+"'";
		System.out.println(query);
		try {
			Connection con = UserDAO.connection();
			Statement st = con.createStatement();
			ResultSet resultSet = st.executeQuery(query);
			if (resultSet.next()) {
				flag = true;
			} else {
				flag = false;
			}

			resultSet.close();
			st.close();
			con.close();
			System.out.println("connection closed successfully");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		System.out.println(flag);
		return flag;
	}
}
