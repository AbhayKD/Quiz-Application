<%@ page language="java" import="co.et15.quizOMania.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style3/material.min.css">
<script src="css/style3/material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Quiz-O-Mania</title>
<style type="text/css">
body {
	background:
		url("${pageContext.request.contextPath}/images/background.jpg");
}

.font{
	font-family: Serif;
	font-size: 150%;
	font-weight: bold;
}
</style>

<link rel="stylesheet" href="css/style3/material.min.css">
<script src="css/style3/material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>
<br />

<body onload="examTimer()">

	<div style="position: absolute; left: 50px; top: 20px">
		<%
			int currentQuestion = ((Exam) request.getSession().getAttribute("currentExam")).getCurrentQuestion();
			// System.out.println("Question Number "+currentQuestion+ " retrieved ");
		%>
		Current Question ${sessionScope.quest.questionNumber+1} /${sessionScope.totalNumberOfQuizQuestions}
	</div>

	<div id="showtime" style="position: absolute; left: 800px; top: 20px"></div>

	<div
		style="position: absolute; width: 1000px; padding: 25px; height: 200px; border: 1px solid green; left: 100px; top: 60px">
		<span class="font">${sessionScope.quest.question}</span><br />
		
		<br />
		<form class="font" action="exam" method="post" name="questionForm" style="font-weight:700;font-size:120%">
			<c:forEach var="choice" items="${sessionScope.quest.questionOptions}"
				varStatus="counter">
				<input type="radio" name="answer" value="${counter.count}">${choice}  <br />
			</c:forEach>
			<br />


			<%-- <c:if test="${sessionScope.quest.questionNumber > 0}">
				<input type="submit" name="action" value="Previous" onclick="customSubmit()" />
			</c:if> --%>

			<c:if
				test="${sessionScope.quest.questionNumber < sessionScope.totalNumberOfQuizQuestions-1}">
				<input class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored" type="submit" name="action" value="Next" onclick="customSubmit()"/>
			
			
			</c:if>
			<input class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored" type="submit" name="action" value="Finish Exam" onclick="customSubmit()" style="position:relative;left:800px"/>
				<input type="hidden" name="time" /> 
				<input type="hidden" name="minute" /> 
				<input type="hidden" name="second" />

		</form>

	</div>



	<script language="javascript">
		var tim;
		var min = '${sessionScope.min}';
		var sec = '${sessionScope.sec}';

		function customSubmit(someValue) {
			document.questionForm.minute.value = min;
			document.questionForm.second.value = sec;
			document.questionForm.time.value=min + sec;
			document.document.questionForm.submit();
		}

		function examTimer() {
			if (parseInt(sec) > 0) {

				document.getElementById("showtime").innerHTML = "Time Remaining :"
						+ min + " Minute ," + sec + " Seconds";
				sec = parseInt(sec) - 1;
				tim = setTimeout("examTimer()", 1000);
			} else {

				if (parseInt(min) == 0 && parseInt(sec) == 0) {
					document.getElementById("showtime").innerHTML = "Time Remaining :"
							+ min + " Minute ," + sec + " Seconds";
					alert("Time Up");
					document.questionForm.minute.value = 0;
					document.questionForm.second.value = 0;
					document.questionForm.submit();

				}

				if (parseInt(sec) == 0) {
					document.getElementById("showtime").innerHTML = "Time Remaining :"
							+ min + " Minute ," + sec + " Seconds";
					min = parseInt(min) - 1;
					sec = 59;
					tim = setTimeout("examTimer()", 1000);
				}

			}
		}
	</script>



</body>
</html>