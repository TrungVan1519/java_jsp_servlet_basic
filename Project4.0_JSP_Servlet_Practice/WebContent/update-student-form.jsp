<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update student</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<link type="text/css" rel="stylesheet" href="css/add-student-style.css">
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>World University</h2>
		</div>
		<div id="container">
			<div id="content">
				<h2>Update student</h2>
			
				<!-- neu su dung method="POST" o day thi no se goi ham doPost() thay vi doGet() -->
				<form action="StudentControllerServlet" method="GET"> 
					<input type="hidden" name="command" value="UPDATE"/>
					<input type="hidden" name="studentId" value="${THE_STUDENT.id }"/>
					
					<table>
						<tbody>
							<tr>
								<td><label>First name:</label></td>
								<td><input type="text" name="firstName" value="${THE_STUDENT.firstName }"></td>
								
							</tr>
							<tr>
								<td><label>Last name:</label></td>
								<td><input type="text" name="lastName" value="${THE_STUDENT.lastName }"></td>
							</tr>
							<tr>
								<td><label>Email:</label></td>
								<td><input type="text" name="email" value="${THE_STUDENT.email }"></td>
							</tr>
							<tr>
								<td><label></label></td>
								<td><input type="submit" value="Save" class="save"></td>
							</tr>
						</tbody>
					</table>
				</form>
				<div style="clear: both;"></div>
				<p><a href="StudentControllerServlet">Back to list</a>
			</div>
		</div>
	</div>
</body>
</html>