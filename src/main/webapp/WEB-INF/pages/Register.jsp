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
	height: 860px;
	background-color: rgba(0, 0, 0, 0.5);
	margin-top: 40px;
	border-radius: 15px;
}
function validate()
{ 
     var name = document.form.name.value;
     var email = document.form.email.value;
     var username = document.form.username.value; 
     var password = document.form.password.value;
     
     else if (username==null || username=="")
     { 
     alert("Username can't be blank"); 
     return false; 
     }
     else if(password.length<6)
     { 
     alert("Password must be at least 6 characters long."); 
     return false; 
     }
     if (name==null || name=="")
     { 
     alert(" Name can't be blank"); 
     return false; 
     }
     else if (email==null || email=="")
     { 
     alert("Email can't be blank"); 
     return false; 
     }
     else if(gender==null  || gender== "")
    	 {
    	 alert("Chose Gender");
    	 return false;
    	 }
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
</head>
<body>
	<header style="height: 30px, background-color: #2196f3; color: white;">
		<span style="font-size: 18px; font-weight: bold;">Welcome!!!></span>
		
	</header>
	<div class="container"
	style="width: 40%">
		<div><br /> <img src="imag/welcome.png" style="height:200px"></div>
		<hr />
		<span style="font-size: 18px; color: red;">${msg}${param.msg}</span> <br />
		
		<h1 style="font-size: 22px; color: white">Total Registration : ${pros}${param.pros} </h1>
		
		<br/>
		<h1 style="font-size: 22px; color: white">Please Register Yourself</h1>
		<h2 style="font-size: 22px; color: white">Thank you!!!</h2>
		<div >
			<form action="Register" method="post" enctype="multipart/form-data">
				<label style=color:white>UserName</label> <input type="text" name="username" placeholder="Enter Username"
					class="form-control" style=width:50%> <label style=color:white>Password</label> <input
					type="password" name="password" placeholder="Enter Password" class="form-control" style=width:50%> <label style=color:white>Name</label>
				<input type="text" name="name" placeholder="Enter Name" class="form-control" style=width:50%> <label style=color:white>Email</label>
				<input type="email" name="email" placeholder="Enter Valid Email Address" class="form-control" style=width:50%> <label style=color:white>Gender</label>
				<select name="gender" class="form-control" style="width: 25%;">
					<option>Select</option>
					<option>Male</option>
					<option>Female</option>
				</select> 
				<label style=color:white>Photo</label>
				<input type="file" name="photo" placeholder="Place Profile Photo's url" class="form-control" style=width:50%><br>
				<button type="submit" class="btn btn-primary">Register</button>
				<button type="reset" class="btn btn-info">Clear</button>
				<a href="auth">
					<button type="button" class="btn btn-danger">Login</button>
				</a>
			</form>
		</div>
	</div>
</body>
</html>