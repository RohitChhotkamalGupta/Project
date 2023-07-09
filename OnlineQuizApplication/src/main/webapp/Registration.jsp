<!DOCTYPE html>
<html>
<head>
<title>Registration Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
body {
	background-color: white;
}

.container {
	border: solid black;
	background-color: #f1f1f1;
	margin-top: 50px;
	width: 400px;
	background-color: #f1f1f1;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	text-decoration: underline;
}

.form-group {
	margin-bottom: 20px;
}

label {
	font-weight: bold;
}

.form-control {
	border-radius: 0;
}

.btn-primary {
	border-radius: 0;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Registration</h2>
		<form action="register" method="POST">
			<div class="form-group">
				<label for="fullName">Full Name:</label> <input type="text"
					class="form-control" id="fullName" name="fullName" required>
			</div>
			<div class="form-group">
				<label for="username">Username:</label> <input type="text"
					class="form-control" id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					class="form-control" id="password" name="password" required>
			</div>
			<div class="form-group">
				<label for="confirmpassword">Confirm Password:</label> <input
					type="password" class="form-control" id="confirmpassword"
					name="confirmpassword" required>
			</div>
			<button type="submit" class="btn btn-primary">Register</button>
		</form>
	</div>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
