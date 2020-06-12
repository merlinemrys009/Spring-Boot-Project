<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	background-image: url(imag/lights.gif);
	background-size: cover;
}

.container {
	width: 50px;
	height: 350px;
	background-color: rgba(0, 0, 0, 0.5);
	margin-top: 40px;
	border-radius: 15px;
}
</style>
</head>
<body></body>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<header style="height: 30px, background-color: #2196f3; color: white;">
		<span style="font-size: 18px; font-weight: bold;">Welcome!!!</span>
	</header>
	<div class="container"
	style="width: 25%">
		<br /> <img src="imag/welcome.png" style=height:100px>
		<hr />
		<span style="font-size: 12px; color: red;">${msg}</span> <br />
		<div >
			<form action="auth" method="POST">
				<label><b style="color: white">UserName</b></label> <input
					type="text" name="username" class="form-control"> <label><b
					style="color: white">Password</b></label> <input type="password"
					name="password" class="form-control"> <br />
					<br>
				<button type="submit" class="btn btn-primary">Login</button>
				<button type="reset" class="btn btn-info">Clear</button>
				<a href="gregister">
					<button type="button" class="btn btn-danger">Register</button>
				</a>
				<a href="ForgotPassword">
					<label>ForgotPassword</label>
				</a>
				<br/>
				<a href="Search">
					<button type="button" class="btn btn-danger">Search</button>
				</a>
			</form>
		</div>
	</div>
</body>
</html>