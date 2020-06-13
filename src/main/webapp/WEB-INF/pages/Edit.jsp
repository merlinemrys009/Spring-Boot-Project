<!DOCTYPE html>
<html>
<style type="text/css">
body {
	background-image: url(imag/lights.gif);
	background-size: cover;
}

.container {
	width: 50px;
	height: 870px;
	background-color: rgba(0, 0, 0, 0.5);
	margin-top: 40px;
	border-radius: 15px;
}
</style>
<head>
 <title>Edit Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 <header style="height: 30px;background-color: #03a9f4;">
 </header>
   <div class="container"
    style="width: 29%">
      <br/>
   <img src="imag/edit.gif" style="height: 150px;" class="rounded-cirle">
    <img src="imag/edit1.gif" style="height: 150px;" class="rounded-circle">
      <br/>
      <br/>
      <span style="font-size: 18px;color: blue;font-weight: bold;">Edit Profile</span>
      <hr/>
      <div>
      <form action="updateProfile" method="post" enctype="multipart/form-data">
       <input type="hidden"  name="id"  value="${p.id}">
      <label style=color:white><b>UserName</b></label>
      <input type="text" name="username"  class="form-control"   value="${p.username}">
        <label style=color:white><b>Name</b></label>
      <input type="text" name="name"  class="form-control" value="${p.name}">
      <label style=color:white><b>Email</b></label>
      <input type="email" name="email"  class="form-control"  value="${p.email}">
      <label style=color:white><b>Gender</b></label>
      <select  name="gender"  class="form-control" style="width: 50%;">
         <option  ${p.gender=='Male' ? 'selected' :''}>Male</option>
         <option  ${p.gender=='Female' ? 'selected' :''}>Female</option>
      </select>
      <label style=color:white><b>Role</b></label>
      <input type="text" name="role"  class="form-control"   value="${p.role}" readonly>
       <label style=color:white><b>Image</b></label>
      <input type=file name="photo"  class="form-control"value="${p.photo}">
      <br/>
        <img src="${pageContext.request.contextPath}/imageLoader?id=${p.id}" style="height: 100px;" class="img-thumbnail">
            <br/>
      <br/>
      <button type="submit" class="btn btn-primary">Update</button>
       <a href="auth">
      <button type="button" class="btn btn-danger">Login</button>
      </a>
      </form>
      </div>
   </div>
</body>
</html> 