<%@page import="com.example.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%! String needToCheckString = "ABC"; %>
	lower the string <%= needToCheckString %>: 
				<%= new CheckingString(needToCheckString).makeItLower() %>
</body>
</html>
