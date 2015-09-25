<%@ page language="java" import="java.util.Date" import="java.text.SimpleDateFormat" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">
<link rel="stylesheet" href="css/style3/material.min.css">
<script src="css/style3/material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style type="text/css">
body {
	background: url("${pageContext.request.contextPath}/images/background.jpg");
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

</style>
<title>Quiz-O-Mania</title>
</head>
<body>

<div style="position:absolute;left:500px;top:70px">
<h3 align="center">Quiz Result</h3>



<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
        <tr>
            <td><b>UserName :</b></td>
            <td><span id="lblSubject">${sessionScope.username}</span></td>
        </tr>
        <tr>
            <td><b>Start Time :</b></td>
            <td ><span id="lblStime">${sessionScope.started}</span></td>
        </tr>
        <tr>
            <td><b>Finish Time :</b></td>
            <td ><span id="lblDtime">${sessionScope.time}</span></td>
        </tr>
              
         <tr>
            <td><b>Total Question :</b></td>
            <td><span id="lblNquestions">20</span></td>
        </tr>
        
       <tr>
            <td><b>Correct :</b></td>
            <td><span id="lblNcans">${requestScope.result}</span></td>
       </tr>
        
    </table>
    
<div style="position:relative;top:100px;left:80px">
<a class="button username" href='${pageContext.request.contextPath}/logout'>Logout</a>
</div>
    
    

<%-- <c:if test="${requestScope.result >= 5}">
   <h3 align="center">Passed</h3>
</c:if>
<c:if test="${requestScope.result < 5}">
   <h3 align="center">Failed</h3>
</c:if> --%>

</div>

</body>
</html>