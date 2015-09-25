<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">
   <link rel="stylesheet" href="css/style3/material.min.css">
	<script src="css/style3/material.min.js"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style type="text/css">
body {
	background: url("${pageContext.request.contextPath}/images/background.jpg");
	opacity:0.8;
	
}
h1 {
   -webkit-text-stroke: 1px black;
   color: black;
   
   /* text-shadow:
       3px 3px 0 #000,
     -1px -1px 0 #000,  
      1px -1px 0 #000,
      -1px 1px 0 #000,
       1px 1px 0 #000; */
}

.demo-card-wide.mdl-card {
  width: 512px;
}
.demo-card-wide > .mdl-card__title {
  color: #fff;
  height: 176px;
  background: url('../assets/demos/welcome_card.jpg') center / cover;
}
.demo-card-wide > .mdl-card__menu {
  color: #fff;
}



</style>
   <script src="script.js"></script>
   <title>Quiz-O-Mania</title>
</head>
<body>

<div id='cssmenu'>
<ul>
   <li class=''><a href='${pageContext.request.contextPath}'><span>Home</span></a></li>
   <li><a href='${pageContext.request.contextPath}/login'><span>Login</span></a></li>
   <li><a href='${pageContext.request.contextPath}/register'><span>Register</span></a></li>
   
</ul>
</div>

<div style="position:relative;top:250px;color:6600CC;background:#E6E6FA;width:1500px;">
<h3 style=position:relative;left:100px;> Congratulation ${requestScope.newUser} your account created successfully , <a href="${pageContext.request.contextPath}/login" style=color:blue;>Login </a>to take the QUIZ.</h3>
</div>


</body>
</html>
