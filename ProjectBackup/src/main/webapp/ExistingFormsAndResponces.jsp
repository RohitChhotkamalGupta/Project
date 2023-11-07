<!DOCTYPE html>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Responsive Page</title>
<style>
body {
	background-image: url("bg2.jpg");
	background-size: cover;
	justify-content: center;
}
th, tr, td {
	color: white;
}
textarea {
	width: auto;
	height: auto;
	text-align: left;
}
.container {
	margin-left: auto;
	margin-right: auto;
	margin-top: 100px;
}
nav {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	background-color: rgb(2, 11, 25);
	color: #fff;
	z-index: 100;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	font-family: 'Arial', sans-serif;
	transition: background-color 0.3s ease-in-out;
}
nav ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: rgb(2, 11, 25);
}
nav ul li {
	float: left;
	margin-right: 20px;
}
nav ul li a {
	display: block;
	padding: 15px 20px;
	text-decoration: none;
	color: #fff;
	transition: color 0.3s ease-in-out;
}
nav ul li a:hover {
	color: #ff9900;
}
@media screen and (max-width: 768px) {
	nav ul {
		display: none;
		position: absolute;
		background-color: #007BFF;
		width: 100%;
		text-align: center;
		top: 60px;
	}
	nav ul li {
		display: block;
		margin-bottom: 10px;
	}
	.menu-toggle {
		display: block;
		position: absolute;
		top: 10px;
		right: 10px;
		color: #fff;
		font-size: 24px;
		cursor: pointer;
		z-index: 101;
	}
	.menu-toggle.open {
		top: 60px;
	}
}
</style>
</head>

<body>
	<%
	String formcreator = request.getParameter("formcreator");
	%>
	<nav>
		<ul>
			<li><a href="index.html">Home</a></li>
			<li><a href="Registration.jsp">Register</a></li>
			<li><a href="LoginForCreatingQuiz.jsp">Create Quiz</a></li>
			<li><a href="LoginForJoiningQuiz.jsp">Join Quiz</a></li>
			<li><a href="CreationOfQuiz.jsp?formcreator=<%=formcreator%>">Exit</a></li>
		</ul>
	</nav>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Form Name</th>
					<th>Form Creator</th>
					<th>Quiz Attempter</th>
					<th>Response</th>
					<th>Marks</th>
					<th>Update Marks</th>
				</tr>
			</thead>
			<tbody>
				<%
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/typroject", "root", "");
					String sql = "select * from responce where formcreator='" + formcreator + "'";
					Statement statement = connection.createStatement();
					ResultSet rs = statement.executeQuery(sql);
					while (rs.next()) {
				%>
				<form action="UpdatedeMarksController" method="post">
					<tr>
						<td>
							<% String formname = rs.getString("formname");%> 
							<input name="formname" type="text" value="<%=formname%>" readonly="readonly">
						</td>
						<td>
							<% formcreator = rs.getString("formcreator"); %> 
							<input name="formcreator" type="text" value="<%=formcreator%>" readonly="readonly">
						</td>
						<td>
							<% String quizattempter = rs.getString("quizattempter"); %> 
							<input name="quizattempter" type="text" value="<%=quizattempter%>" readonly="readonly">
						</td>
						<td>
							<% String responce = rs.getString("responce"); %> 
							<textarea id="code-preview" readonly name="formbody"><%=responce%></textarea>
						</td>
						<td>
							<% String marks = rs.getString("marks"); %> 
							<input name="marks" type="number" value="<%=marks%>">
						</td>
						<td><button name="updatebutton" value="updatebutton" class="btn btn-primary btn-sm">Update Marks</button></td>
					</tr>
				</form>
				<%
				}
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				%>
			</tbody>
		</table>
	</div>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
