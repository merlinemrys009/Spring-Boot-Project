<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
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
	height: 420px;
	background-color: rgba(0, 0, 0, 0.5);
	box-sizing: border-box;
	margin-top: 40px;
	border-radius: 15px;
}

.user {
	width: 100px;
	heigh: 100px;
	border-radius: 50%;
	overflow: hidden;
	position: absolute;
	top: calc(-100px/ 2);
	left: calc(120px);
}

.btn-primary {
	width: 240px;
}

.btn-danger {
	width: 150px;
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
<script>
   
        function clearText(){
        	   //span
        	  document.getElementById("usernameError").innerHTML="";
        	  document.getElementById("passwordError").innerHTML="";
        	  document.getElementById("genMessage").innerHTML="";
        }
   
         function validateAuth() {
        	   var   usernameObj=document.getElementById("username");
        	   var  usernameText=usernameObj.value;
        	   if(usernameText.length==0){
        		     document.getElementById("usernameError").innerHTML="Username can't be blank";
        		     usernameObj.focus();
        		     return;
        	   }
        	   var   passwordObj=document.getElementById("password");
               var  passwordText=passwordObj.value;
               if(passwordText.length==0){
            	   passwordObj.focus();
                     document.getElementById("passwordError").innerHTML="Password can't be blank, must be at least 6 characters long";
                     return;
               }
               //THis submitting the form
               document.authForm.submit();
        	   
         }             
   
   </script>
</head>
<body>
	<header style="height: 30px, background-color: #2196f3; color: white;">
		<span style="font-size: 18px; font-weight: bold;">Welcome!!!</span>
	</header>
	<div class="container" style="width: 25%">
		<br /> <img src="imag/user.png" style="height: 100px" class="user">
		<hr />
		<span style="font-size: 18px; color: red;" id="genMessage">${msg}</span>
		<br />
		<div>
			<form name="authForm" action="auth" method="POST">
				<label><b style="color: white">UserName</b></label> <input
					type="text" name="username" id="username" class="form-control"
					onkeyup="clearText();"> <span
					style="color: red; font-size: 12px;" id="usernameError"></span><br>
				<label><b style="color: white">Password</b></label> <input
					type="password" name="password" id="password" class="form-control"
					onkeyup="clearText();"> <span
					style="color: red; font-size: 12px;" id="passwordError"></span> <br />

				<button type="button" class="btn btn-primary"
					onclick="validateAuth();">Login</button>
				<button type="reset" class="btn btn-info">Clear</button>
				<br />
				<br> <a href="gregister">
					<button type="button" class="btn btn-danger">Register</button>
				</a> <a href="Search">
					<button type="button" class="btn btn-danger">Search</button>
				</a> <br> <a href="ForgotPassword"> <label>ForgotPassword</label>
				</a> <br />
			</form>
		</div>
	</div>
</body>
</html>