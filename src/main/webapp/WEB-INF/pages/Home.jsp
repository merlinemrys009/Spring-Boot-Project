<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
      ul{
        padding: 0;
        list-style: none;
        background: rgba(0, 0, 0, 0.7);
    }
    ul li{
        display: inline-block;
        position: relative;
        line-height: 21px;
        text-align: left;
    }
    ul li a{
        display: block;
        padding: 8px 25px;
        color: #333;
        text-decoration: none;
    }
    ul li a:hover{
        color: #fff;
        background: #939393;
    }
    ul li ul.dropdown{
        min-width: 100%; /* Set width of the dropdown */
        background: rgba(0, 0, 0, 0.5);
        display: none;
        position: absolute;
        z-index: 999;
        left: 0;
    }
    ul li:hover ul.dropdown{
        display: block; /* Display the dropdown */
    }
    ul li ul.dropdown li{
        display: block;
    }
body {
	background-image: url(imag/lights.gif);
	background-size: cover;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 350px;
	height: 560px;
	background-color: rgba(0, 0, 0, 0.7);
	box-sizing: border-box;
	margin-top: 150px;
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
	<header style="height: 150px; background-color: #2196f3; color: white;">
		<span style="font-size: 25px; margin-left:650px; font-weight: bold;">Welcome Home</span>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<ul>
        <li>
        <li>
            <a href="#" style=color:white>Menu &#9662;</a>
            <ul class="dropdown">
                <li><a href="auth#" style=color:white>Home</a></li>
                <li><a href="profile" style=color:white>Profile</a></li>
                <li><a href="Search" style=color:white>Search</a></li>
                <li><a href="#" style=color:white>About us</a></li>
                <li><a href="auth" style=color:white>Logout</a></li>
            </ul>
        </li>
        <li><a href="#" style=color:white>Contact</a></li>
    </ul>
	</header>
	<div class="container">
		<br /> <img src="${pageContext.request.contextPath}/imageLoader?id=${p.id}" style="height: 150px;"
			class="img-thumbnail"> <img src="imag/welcome.png"
			style="height: 150px;" class="img-thumbnail"> <img
			src="imag/man.jpg" style="height: 150px;" class="img-thumbnail">
			<a href="profile">
			<img
			src="imag/Profile.jpg" style="height: 150px;" class="img-thumbnail"></a>
		<hr />
		<span style="font-size: 18px; color: red;">${msg}</span>
		<h2 style = color:blue>Welcome Home <br/>${p.name}</h2>
		<hr />
		<h4 style=color:white>Email :${p.email}</h4>
			<h4 style=color:white>Gender :${p.gender}</h4>
				<h4 style=color:white>Role :${p.role}</h4>
				<h4 style=color:white>Unique Id : ${p.id}
				<a href="editProfile?id=${p.id}">
				<br/>
					<img src="imag/edit1.png" style="height: 24px;">
				</a>
				</h4>
				
		<hr />
		</div>
</body>
</html>