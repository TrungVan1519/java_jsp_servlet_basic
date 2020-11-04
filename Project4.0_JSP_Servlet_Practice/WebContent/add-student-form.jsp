<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add student</title>
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
				<h2>Add student</h2>
			
				<!-- neu su dung method="GET" o day thi no se goi ham doGet() thay vi doPost() -->
				<form action="StudentControllerServlet" method="POST"> 
					<input type="hidden" name="command" value="ADD"/>
					
					<table>
						<tbody>
							<tr>
								<td><label>First name:</label></td>
								<td><input type="text" name="firstName"></td>
								
							</tr>
							<tr>
								<td><label>Last name:</label></td>
								<td><input type="text" name="lastName"></td>
							</tr>
							<tr>
								<td><label>Email:</label></td>
								<td><input type="text" name="email"></td>
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