<!DOCTYPE html>
<%@page import="rab3.dao.entity.ProfileEntity"%>
<%@page import="java.util.List"%>
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
	height: 450px;
	background-color: rgba(0, 0, 0, 0.5);
	margin-top: 40px;
	border-radius: 15px;
}
</style>
</head>
<body></body>
<title>Search</title>
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
	<span style="font-size: 18px; font-weight: bold;">Welcome to Search page</span></header>
	<div class="container">
	<br /> <img src="imag/search.gif" style=height:100px>
		<hr />
		<form action="Search" method="POST" enctype="multipart/form-data">
		<label style=color:white>Search by Email Id</label>
				<input type="email" name="email" placeholder="Search for Profile" class="form-control" style=width:35%><br/>
				<button type="submit" class="btn btn-primary">Search</button>
				<table class="table table-dark table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>User Name</th>
					<th>Name</th>
					<th>Email</th>
					<th>Gender</th>
					<th>Photo</th>
				</tr>
			</thead>
			<tbody>
				<%
		ProfileEntity dto=(ProfileEntity)request.getAttribute("searchP");
				if(dto!=null)
				{
    	
    %>
				<tr>
					
					<td><%=dto.getId() %></td>
					<td><%=dto.getUsername() %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getEmail() %></td>
					<td><%=dto.getGender() %></td>
					<td><%=dto.getPhoto() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<a href="auth">
			<button type="button" class="btn btn-primary">Back</button>
		</a>
		</form>
		
	</div>
	</body>
	</html>