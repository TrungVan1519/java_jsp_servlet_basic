<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Tracker App</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>World University</h2>
		</div>
	</div>
	<div id="container">
		<div id="content">
			<!-- put new button: Add student -->
			<input type="button" value="Add student"
					onclick="window.location.href='add-student-form.jsp'; return false;"
					class="add-student-button" />
			
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action Update</th>
					<th>Action Delete</th>
				</tr>
				<c:forEach var="student" items="${STUDENT_LIST }">
					<tr>
						<td> ${student.firstName } </td>
						<td> ${student.lastName } </td>
						<td> ${student.getEmail() } </td>
						
						<!-- set up a link to update student -->
						<!-- Cach 1 -->
						<c:url var="tempLink" value="StudentControllerServlet">
							<c:param name="command" value="LOAD"/>
							<c:param name="studentId" value="${student.id }"/>
						</c:url>
						<td><a href="${tempLink }">Update</a></td>
						<!-- Cach 2 -->
						<td><a href="StudentControllerServlet?command=UPDATE&studentId=${student.id }">Update</a>
						
						<!-- set up a link to delete a student -->
						<c:url var="deleteLink" value="StudentControllerServlet">
							<c:param name="command" value="DELETE"/>
							<c:param name="studentId" value="${student.id }"/>
						</c:url>
						<td><a href="${deleteLink }"
						onclick="if(!(confirm('Are you sure you want to delete this student?'))) return false">Delete</a></td>
						<!-- > Doan code trong ham onclick la code JS -->
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>