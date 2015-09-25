<%@ page language="java" import="java.util.Random"  contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
   <link rel="stylesheet" href="css/style2.css">
    <style type="text/css">
body {
	background: url("images/background.jpg");
}
.button {
	padding: 10px 15px;
	font-size: 14px;
	line-height: 100%;
	text-shadow: 0 1px rgba(0, 0, 0, 0.4);
	color: #fff;
	
	vertical-align: middle;
	text-align: center;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.1s ease-in-out;
	-webkit-transition: background 0.1s ease-in-out;
	-moz-transition: background 0.1s ease-in-out;
	-ms-transition: background 0.1s ease-in-out;
	-o-transition: background 0.1s ease-in-out;
	text-shadow: 0 1px rgba(0, 0, 0, 0.3);
	color: #fff;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
	font-family: 'Helvetica Neue', Helvetica, sans-serif;
}

.button, .button:hover, .button:active {
	outline: 0 none;
	text-decoration: none;
        color: #fff;
}

.username {
	background-color: #2ecc71;
	box-shadow: 0px 3px 0px 0px #239a55;
}

h1{
	font-size: 3.5em;
	position:relative;
	top:130px;
	left:100px;
	font-family:  sans-serif;
	color: #1E90FF;
	text-shadow: 1px 1px 0 #333, 1px -1px 0 #333, -1px 1px 0 #333, -1px -1px 0 #333;
}

.btn {
  background: #3498db;
  background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
  background-image: -moz-linear-gradient(top, #3498db, #2980b9);
  background-image: -ms-linear-gradient(top, #3498db, #2980b9);
  background-image: -o-linear-gradient(top, #3498db, #2980b9);
  background-image: linear-gradient(to bottom, #3498db, #2980b9);
  -webkit-border-radius: 21;
  -moz-border-radius: 21;
  border-radius: 21px;
  -webkit-box-shadow: 4px 3px 8px #666666;
  -moz-box-shadow: 4px 3px 8px #666666;
  box-shadow: 4px 3px 8px #666666;
  font-family: Arial;
  color: #fffaff;
  font-size: 30px;
  padding: 12px 24px 12px 24px;
  border: solid #3deba5 6px;
  text-decoration: none;
}

.btn:hover {
  background: #0da0fc;
  background-image: -webkit-linear-gradient(top, #0da0fc, #197cbf);
  background-image: -moz-linear-gradient(top, #0da0fc, #197cbf);
  background-image: -ms-linear-gradient(top, #0da0fc, #197cbf);
  background-image: -o-linear-gradient(top, #0da0fc, #197cbf);
  background-image: linear-gradient(to bottom, #0da0fc, #197cbf);
  text-decoration: none;
}

</style>
  
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

<c:if test='${not empty sessionScope.user}'>

<div style="position:absolute;top:20px;left:900px">
<a href="#" class="button username">Logged as: ${sessionScope.user}</a>
</div>

<div style="position:absolute;top:20px;left:1200px">
<a class="button username" href='${pageContext.request.contextPath}/logout'>Logout</a>
</div>

</c:if>

<h1>Welcome to ENGINEERING TODAY-2015!!!!</h1>


<%!
  	 String[] files = {"takeExam?test=1","takeExam?test=2"};
	 		
	public static String[] shuffle(String[] f){
	 for (int i=0; i<f.length; i++) {
		    int randomPosition = new Random().nextInt(f.length);
		    String temp = f[i];
		    f[i] = f[randomPosition];
		    f[randomPosition] = temp;
	} 
	 return f;
	}
	
	String[] v =shuffle(files);

	
	int idx = new Random().nextInt(v.length);
    String random = (v[idx]);
	
    /* return random;
    }  */
%>

<a href="<%= random%>">
<button class="btn hover"  style="position:absolute;top:400px;left:500px">TAKE THE QUIZ</button>
</a>
</body>
</html>
