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
	height: 1050px;
	background-color: rgba(0, 0, 0, 0.5);
	box-sizing: border-box;
	margin-top: 40px;
	border-radius: 15px;
}
</style>
</head>
<body></body>
<title>Register</title>
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
 	   
	 	  document.getElementById("usernameError").innerHTML="";
	 	  document.getElementById("passwordError").innerHTML="";
	  	  document.getElementById("nameError").innerHTML="";
	  	  document.getElementById("emailError").innerHTML="";
	  	  document.getElementById("genderError").innerHTML="";
	  	  document.getElementById("photoError").innerHTML="";
	  	  
	}

	function validateReg()
	{ 
		 var   usernameObj=document.getElementById("username");
         var  usernameText=usernameObj.value;
         if(usernameText.length==0){
        	 usernameObj.focus();
               document.getElementById("usernameError").innerHTML="Username can't be blank, input your email";
               return;
         }
         var   passwordObj=document.getElementById("password");
         var  passwordText=passwordObj.value;
         if(passwordText.length<=6){
        	 passwordObj.focus();
               document.getElementById("passwordError").innerHTML="Password can't be blank, & must be at least 6 characters long";
               return;
         }
		 var   usernameObj=document.getElementById("name");
  	   	var  nameText=usernameObj.value;
  	   if(nameText.length==0){
  		     document.getElementById("nameError").innerHTML="Name can't be blank";
  		     usernameObj.focus();
  		     return;
  	   }
  	   var   emailObj=document.getElementById("email");
         var  emailText=emailObj.value;
         if(emailText.length==0){
      	   emailObj.focus();
               document.getElementById("emailError").innerHTML="Email can't be blank, Input your email";
               return;
         }
         var   genderObj=document.getElementById("gender");
         var  genderText=genderObj.value;
         if(genderText.length==0){
      	   genderObj.focus();
               document.getElementById("genderError").innerHTML="Please Choose Gender";
               return;
         }
         var   photoObj=document.getElementById("photo");
         var  photoText=photoObj.value;
         if(photoText.length==0){
      	   photoObj.focus();
               document.getElementById("photoError").innerHTML="Please Select any Picture";
               return;
         }
         
	     document.registerForm.submit();
	 }  
	</script>
</head>
<body>
	<header style="height: 30px, background-color: #2196f3; color: white;">
		<span style="font-size: 18px; font-weight: bold;">Welcome!!!></span>

	</header>
	<div class="container" style="width: 40%">
		<div>
			<br /> <img src="imag/welcome.png" style="height: 200px">
		</div>
		<hr />
		<span style="font-size: 18px; color: red;">${param.msg}</span> <br />

		<h1 style="font-size: 22px; color: white">Total Registration :
			${param.pros}</h1>

		<br />
		<h1 style="font-size: 22px; color: white">Please Register
			Yourself</h1>
		<h2 style="font-size: 22px; color: white">Thank you!!!</h2>
		<div>
			<form name=registerForm action="Register" method="post"
				enctype="multipart/form-data">
				<label style="color: white">UserName</label> <input type="text"
					name="username" id="username" placeholder="Enter Username"
					class="form-control" style="width: 50%" onkeyup="clearText();">
				<span style="color: red; font-size: 12px;" id="usernameError"></span><br>
				<label style="color: white">Password</label> <input type="password"
					name="password" id="password" placeholder="Enter Password"
					class="form-control" style="width: 50%" onkeyup="clearText();">
				<span style="color: red; font-size: 12px;" id="passwordError"></span><br>
				<label style="color: white">Name</label> <input type="text"
					name="name" id="name" placeholder="Enter Name" class="form-control"
					style="width: 50%" onkeyup="clearText();"> <span
					style="color: red; font-size: 12px;" id="nameError"></span><br>
				<label style="color: white">Email</label> <input type="email"
					name="email" id="email" placeholder="Enter Valid Email Address"
					class="form-control" style="width: 50%" onkeyup="clearText();">
				<span style="color: red; font-size: 12px;" id="emailError"></span><br>
				<label style="color: white">Gender</label> <select name="gender"
					id="gender" class="form-control" style="width: 25%;"
					onkeyup="clearText();">
					<option>Select</option>
					<option>Male</option>
					<option>Female</option>
				</select><br>
				<label style="color: white">Photo</label> <input type="file"
					name="photo" id="photo" placeholder="Place Profile Photo's url"
					class="form-control" style="width: 50%" onkeyup="clearText();">
				<span style="color: red; font-size: 12px;" id="photoError"></span> <br>
				<button type="button" class="btn btn-primary"
					onclick="validateReg();">Register</button>
				<button type="reset" class="btn btn-info">Clear</button>
				<a href="auth">
					<button type="button" class="btn btn-danger">Login</button>
				</a>
			</form>
		</div>
	</div>
</body>
</html>