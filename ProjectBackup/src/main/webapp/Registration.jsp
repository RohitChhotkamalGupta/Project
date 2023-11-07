<!DOCTYPE html>
<html>
<head>
<title>Registration Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-image: url("bg2.jpg");
	background-size: cover;
}

.container {
	border: solid black;
	background-color: white;
	margin-top: 100px;
	width: 400px;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
}

.container:hover {
	background-color: rgb(1, 19, 47);
	transform: scale(1.15);
	/* Increase the size on hover */
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
	/* Add a subtle shadow */
	border: 2px solid white;
	color: white;
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
	text-decoration: underline;
}

.form-control {
	border-radius: 10px;
}

.btn-primary {
	border-radius: 0;
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
	<nav>
		<ul>
			<li><a href="index.html">Home</a></li>
			<li><a href="Registration.jsp">Register</a></li>
			<li><a href="LoginForCreatingQuiz.jsp">Create Quiz</a></li>
			<li><a href="LoginForJoiningQuiz.jsp">Join Quiz</a></li>
		</ul>
	</nav>
	<div class="container">
		<h2>Registration</h2>
		<form action="RegistrationController" method="POST">
			<div class="form-group">
				<label for="fullName"><strong>Name</strong></label> 
				<input type="text" placeholder="Enter name here" class="form-control" id="name" name="name" required>
			</div>
			<div class="form-group">
				<label for="confirmpassword"><strong>E-Mail</strong></label> 
				<input placeholder="Enter Email here" type="email" class="form-control" id="email" name="email" required>
			</div>
			<div class="form-group">
				<label for="username"><strong>Username</strong></label> 
				<input type="text" placeholder="Enter Username here" class="form-control" id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="password"><strong>Password</strong></label> 
				<input type="password" placeholder="Enter Passwrd here" class="form-control" id="password" name="password" required>
			</div>

			<center><button type="submit" class="btn btn-primary">Register</button></center>
		</form>
	</div>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
