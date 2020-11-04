<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<%
		String language = request.getParameter("favoriteLanguage");
		Cookie cookie = new Cookie("myApp.favoriteLanguage", language);
		cookie.setMaxAge(60*60*24); // <= 1 day
		response.addCookie(cookie);
	%>
</head>
<body>
	Thanks! We set your favorite language to: <%= request.getParameter("favoriteLanguage") %>
	<br/>
	<a href="cookie_homepage.jsp">Return homepage</a>
</body>
</html>