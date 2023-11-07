<!DOCTYPE html>
<html>
<head>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background-image: url("bg2.jpg");
	background-size: cover;
}

#form-container {
	max-width: 600px;
	margin: 20px;
	padding: 50px;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	animation: fadeInUp 0.5s ease;
	margin-bottom: 20px;
	margin-top: 75px;
	transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
}

#form-container:hover {
	background-color: rgb(1, 19, 47);
	transform: scale(1.05);
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
	border: 2px solid white;
	color: white;
}

#form-container:hover {
	color: white;
}

#form-container h1 {
	font-size: 28px;
	margin-bottom: 20px;
	margin-top: -20px;
	text-decoration: underline;
}

button {
	margin: 5px;
	padding: 10px 20px;
	background-color: #007bff;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
	font-size: 14px;
}

button:hover {
	background-color: #0056b3;
}

#form-preview {
	margin-top: 30px;
	padding: 20px;
	border: 1px solid #ccc;
	background-color: #f9f9f9;
	border-radius: 5px;
	text-align: left;
	color: black;
}

#name-of-form {
	margin-bottom: 20px;
	text-align: left;
}

#name-of-form label {
	font-size: 18px;
	margin-bottom: 5px;
}

#name-of-form input[type="text"] {
	width: 50%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f9f9f9;
	transition: border-color 0.3s;
}

#name-of-form input[type="number"]:focus {
	border-color: #007bff;
}

#time-for-form {
	margin-bottom: 20px;
	text-align: left;
}

#time-for-form label {
	font-size: 18px;
	margin-bottom: 5px;
}

#time-for-form input[type="number"] {
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f9f9f9;
	transition: border-color 0.3s;
}

#time-for-form input[type="text"]:focus {
	border-color: #007bff;
}

#code-container {
	margin-top: 30px;
	text-align: left;
}

#code-preview {
	width: 100%;
	height: 200px;
	resize: none;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-family: monospace;
}

input[type="submit"] {
	margin-top: 30px;
	padding: 10px 20px;
	background-color: #4caf50;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
	font-size: 14px;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

@
keyframes fadeInUp {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
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
<title>Form Creator</title>
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
	<form action="FormController" method="post">
		<div id="form-container">
			<h1>Form Creator</h1>
			<%
				String formcreator = request.getParameter("formcreator");
			%>
			<input type="text" id="formcreator" name="formcreator" value="<%=formcreator%>" hidden>
			<button id="add-label" type="button">Add Label</button>
			<button id="add-checkbox" type="button">Add Checkbox</button>
			<button id="add-radiobutton" type="button">Add Radio Group</button>
			<button id="generate-form" type="button">Generate Form</button>
			<br> <br>
			<div id="name-of-form">
				<label>Enter name of the form : </label> 
				<input type="text" id="formname" name="formname" required>
			</div>
			<div id="time-for-form">
				<label for="timeInput">Time limit for quiz(In Minutes) : </label> 
				<input type="number" id="timeInput" name="timeInput" min="0" step="1" required="required"> <br>
			</div>
			<div id="form-preview"></div>
			<div id="code-container">
				<h2>Generated Code</h2>
				<textarea id="code-preview" readonly name="formbody"></textarea>
			</div>
			<br> <input type="submit" name="Submit"> 
			<a href="ExistingFormsAndResponces.jsp?formcreator=<%=formcreator%>"><br>
			<br> Existing forms and responses you've created</a>
		</div>
		<br>
		<script src="script.js"></script>
	</form>
</body>
</html>