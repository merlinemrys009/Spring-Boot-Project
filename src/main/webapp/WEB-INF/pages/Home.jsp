
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
	height: 560px;
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
	<header style="height: 50px; background-color: #2196f3; color: white;">
		<span style="font-size: 18px; font-weight: bold;">Welcome Home</span>
	</header>
	<div class="container">
		<br /> <img src="${something.image}" style="height: 150px;"
			class="img-thumbnail"> <img src="imag/welcome.png"
			style="height: 150px;" class="img-thumbnail"> <img
			src="imag/man.jpg" style="height: 150px;" class="img-thumbnail">
			<a href="profile">
			<img
			src="imag/Profile.jpg" style="height: 150px;" class="img-thumbnail"></a>
		<hr />
		<h2 style = color:blue>Welcome Home <br/> ${p.name}</h2>
		<hr />
		<h4 style=color:white>Email : ${p.email}</h4>
			<h4 style=color:white>Gender : ${p.gender}</h4>
				<h4 style=color:white>Role : ${p.role}</h4>
				<h4 style=color:white>Unique Id : ${p.id}
				<a href="editProfile?id=${p.id}">
				<br/>
					<img src="imag/edit1.png" style="height: 24px;">
				</a>
				</h4>
				
		<hr />
		<a href="auth">
			<button type="button" class="btn btn-primary">Back</button>
		</a>
		</div>
</body>
</html>