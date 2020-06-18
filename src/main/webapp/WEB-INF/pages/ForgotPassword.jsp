<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org/">
<style type="text/css">
body {
	background-image: url(imag/lights.gif);
	background-size: cover;
}

.container {
	width: 50px;
	height: 630px;
	background-color: rgba(0, 0, 0, 0.5);
	margin-top: 40px;
	border-radius: 15px;
}
</style>
<head>
 <title>ForgotPassword</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script>
  
  function findPassword(){
	      //var email=document.getElementById("email").value;
	      var pemail=$("#email").val();
      
	      //This is AJAX call to communicate with rest API or controller
	      var promise=fetch("api2/password/email?email="+pemail);
       
	     promise.then((resp) => resp.json()) // Transform the data into json
       .then(function(data) { //JavaScript from JSON
       	 console.log(data);  //data={"email":"93939"}
       	 $("#tpassword").html(data.message);
       });
	    
  } //end of function
  </script>
</head>
<body>
 <header style="height: 30px;background-color: #03a9f4;">
 </header>
   <div class="container">
      <br/>
     <img src="imag/Welcome-to-the-Party.png" style="height: 150px;"  class="img-thumbnail">
      <hr/>
      <span style="font-size: 18px;color: red;">${msg}</span>
      <br/>
      <div style="width: 35%">
      <form action="ForgotPassword" method="POST">
      <label style=color:white><b>Email Id</b></label>
      <input type="email" name="email" id="email" class="form-control"  value="${param.email}">
      <br/>
    	  <button type="button" class="btn btn-primary" onclick="findPassword();">Forgot Pass</button>
       <a href="auth">
    	  <button type="button" class="btn btn-danger">Login</button>
      </a>
      <hr/>
      <h5 style="color: red;font-weight: bold;" id="tpassword">..</h5>
      </form>
      </div>
   </div>
</body>
</html>