<%@page import="rab3.controller.dto.ProfileDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org/">
<head>
<title>Profile</title>
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
.pagination {
  display: inline-block;
}

.pagination a {
	width: 50px;
	height: 50px;
	background-color: rgba(0, 0, 0, 0.5);
	margin-top: 40px;
	border-radius: 15px;
  color: white;
  float: right;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
width: 50px;
	height: 50px;
	background-color: rgba(0, 0, 0, 0.5);
	margin-top: 40px;
	border-radius: 15px;
  background-color: #4CAF50;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;
}

body {
	background-image: url(imag/lights.gif);
	background-size: cover;
}

.container {
	width: 50px;
	height: 905px;
	background-color: rgba(0, 0, 0, 0.7);
	margin-top: 40px;
	border-radius: 15px;
}

.registry {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 350px;
	height: 625px;
	background-color: rgba(0, 0, 0, 0.7);
	box-sizing: border-box;
	margin-top: 350px;
	border-radius: 15px;
}
</style>
</head>
<body></body>
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
	function saveProfle(){
  	  var profile={};
  	  profile.id=$("#id").val();
  	  profile.username=$("#username").val();
  	  profile.password=$("#password").val();
  	  profile.name=$("#name").val();
  	  profile.email=$("#email").val();
  	  profile.gender=$("#gender").val();
  	  profile.role=$("#role").val();
  	  
  	  //JavaScript Object into json
        var jsonString= JSON.stringify(profile);
  	  
       const options = {
                method: 'POST',
                body: jsonString,
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                }
              };
              var promise=fetch('api2/profile', options);
              promise .then(res => res.json())
                .then(data => {
                    console.log(data);
                    $("#m_message").html(data.message);
                  //closing modal
                    $("#addProfileModal").modal("hide");
                  
                    var content=""; 
                    content=content+'<tr>';
                    content=content+'  <td>'+ profile.id+'</td>';
                    content=content+'  <td>'+ profile.username+'</td>';
                    content=content+'  <td>'+ profile.name+'</td>';
                    content=content+'  <td>'+ profile.email+'</td>';
                    content=content+'<td>'+ profile.gender+'</td>';
                    content=content+'<td> </td>';
                    content=content+'<td> </td>';
                    content=content+'<td> </td>';
                    content=content+'</tr>';
                    $("#tblbody").append(content);
                  
                });
  }
  


  function openAddProfile(){
      $("#addProfileModal").modal("show");
}
	
    	   function deleteRow(id) {
    		          var obj={};
    		          obj.id=id;
    		          obj.appname="rab3";
    		          //JavaScript Object into json
    		           var jsonString= JSON.stringify(obj);
    		        	
    		          const options = {
    		        		   method: 'DELETE',
    		        		   body: jsonString,
    		        		   headers: {
    		        		     'Content-Type': 'application/json',
    		        		     'Accept': 'application/json'
    		        		   }
    		        		 };
    		        		 var promise=fetch('api2/delprofile', options);
    		        		
    		        		 promise .then(res => res.json())
    		        		   .then(data => {
    		        			   console.log(data);
    		        			   $("profile_"+id).hide();
    		        			   $("#m_message").html(data.message);
    		        		   });
    		         
	      }
	</script>
	<style>
.zoom {
  transition: transform .2s; /* Animation */
  margin: 0 auto;
  height: 120px;
}
.zoom:hover {
  transform: scale(2.0); /* (200% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
}
</style>
	
</head>
<body>
	<header style="height: 150px; background-color: darkblue;">
	<span style="font-size: 25px; margin-left:650px;; font-weight: bold;"></span>
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
		<br />
		 <img src="imag/girly.gif" style="height: 150px;"
			class="img-thumbnail"> <img src="imag/Profile.jpg"
			style="height: 150px;" class="img-thumbnail"> <a
			href="profile"> <img src="imag/profile2.gif"
			style="height: 150px;">
			<br/>
			<span style="font-size: 18px; color: red;">${msg}</span> <br />
		</a>
		<hr />
		<span id="m_message" style="font-size: 18px;color: red;"></span>
		<h4 style="color: lightblue">Welcome ${profile.username}</h4>
		<h4 style="color: lightblue">Profiles Info</h4>
		<button type="button" class="btn btn-primary" onclick="openAddProfile();">Add Profile</button>
		<div class="pagination" style=padding-left:950px>
  <a href="#" style=font-size:9px>&laquo; Previous</a>
  <a href="#" style=font-size:8px>1- ${pros-pgsize} of ${pros}${param.pros}</a>
  <a href="#" style=font-size:9px>&raquo; Next</a>
</div>
		<table class="table table-dark table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>User Name</th>
					<th>Name</th>
					<th>Email</th>
					<th>Gender</th>
					<th>Role</th>
					<th>Picture</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody id="tblbody">
				<%
    	List<ProfileDTO> profiles=(List<ProfileDTO>) request.getAttribute("p");
    	for (ProfileDTO dto : profiles) {
    %>
				<tr  id="profile_<%=dto.getId() %>">
					<td><%=dto.getId() %></td>
					
					<td><%=dto.getUsername() %>
					<br>
					<br>
					</a> &nbsp; &nbsp; &nbsp;<a href="emailProfile?email=<%=dto.getEmail() %>"><img 
					src="imag/email.png" style="height: 24px"></a></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getEmail() %></td>
					<td><%=dto.getGender() %></td>
					
					<td><%=dto.getRole() %></td>
					<td>
        <img src="imageLoader?id=<%=dto.getId() %>"  class="zoom">  

        </td>
					<td>
					<a href="javascript:deleteRow(<%=dto.getId() %>);">
					 <img src="imag/delete.png" style="height: 24px;">
					</a> &nbsp; &nbsp; &nbsp; <a href="editProfile?id=<%=dto.getId() %>">
							<img src="imag/edit.png" style="height: 24px;">
					</a></td>
				</tr>
				<%} %>
			</tbody>
		</table>
<!-- 		<a href="auth">
			<button type="button" class="btn btn-primary">Back</button>
		</a> -->
	</div>
	<!-- The Modal -->
<div class="modal" id="addProfileModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      
   <form class= "registry" id="addProfileForm" name=registerForm action="Register" method="post">
      <!-- Modal body -->
      <div class="modal-header">
        <h4 class="modal-title"  style="color: white">Add Profile</h4>
        <button type="button" class="close" data-dismiss="modal"  style="color: white">&times;</button>
      </div>
      <div class="modal-body">

      <label style="color: white">UserName</label> <input type="text"
					name="username" id="username" placeholder="Enter Username"
					class="form-control" style="width: 75%" onkeyup="clearText();">
				<span style="color: red; font-size: 12px;" id="usernameError"></span>
				<label style="color: white">Password</label> <input type="password"
					name="password" id="password" placeholder="Enter Password"
					class="form-control" style="width: 75%" onkeyup="clearText();">
				<span style="color: red; font-size: 12px;" id="passwordError"></span>
				<label style="color: white">Name</label> <input type="text"
					name="name" id="name" placeholder="Enter Name" class="form-control"
					style="width: 75%" onkeyup="clearText();"> <span
					style="color: red; font-size: 12px;" id="nameError"></span>
				<label style="color: white">Email</label> <input type="email"
					name="email" id="email" placeholder="Enter Valid Email Address"
					class="form-control" style="width:75%" onkeyup="clearText();">
				<span style="color: red; font-size: 12px;" id="emailError"></span>
				<label style="color: white">Gender</label> <select name="gender"
					id="gender" class="form-control" style="width: 50%;"
					onkeyup="clearText();">
					<option>Select</option>
					<option>Male</option>
					<option>Female</option>
				</select>
				<label style="color: white">Photo</label> <input type="file"
					name="photo" id="photo" placeholder="Place Profile Photo's url"
					class="form-control" style="width: 75%" onkeyup="clearText();">
				<span style="color: red; font-size: 12px;" id="photoError"></span> 
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick="saveProfle();">Save</button>
      </div>
 </form>
    </div>
  </div>
</div>
</body>
</html>
