<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style2.css">
<title>Quiz-O-Mania</title>
<style type="text/css">
body {
	background: url("images/background.jpg");
}
</style>

<link rel="stylesheet" href="css/style3/material.min.css">
<script src="css/style3/material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>


<body>
<div id='cssmenu'>
<ul>
   <li class=''><a href='${pageContext.request.contextPath}'><span>Home</span></a></li>
   <li><a href='${pageContext.request.contextPath}/login'><span>Login</span></a></li>
   <li><a href='${pageContext.request.contextPath}/register'><span>Register</span></a></li>
  
</ul>
</div>
<br><br><br>
<h2 align="center">Instructions for Quiz : </h2>

<div style="position:absolute;left:500px;top:170px">
<ul style="list-style-type:disc">
 <li>Quiz contains 20 Multiple Choice Questions</li>
 <li>Total time for the Quiz is 10 Minutes</li>
 <li>You can finish the Quiz at any time</li>
<li>You are not allowed to go to the previous question</li>
<li>Minimizing the browser will result in <b>DISQUALIFICATION</b></li>
<li>All Question must be ATTEMPTED.</li>
 <li>Good luck for the Quiz.</li>
 <li><b>LETS SEE WHAT YOU GOT!!!</b></li>
</ul>  
<br><br><br>
</div>


<div  style="position:relative;left:600px;top:200px">
<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="location.href='${pageContext.request.contextPath}/exam'">
  Start Quiz
</button>
</div>


</body>
</html>