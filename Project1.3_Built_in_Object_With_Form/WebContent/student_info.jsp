<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%--Cach viet day du de lay du lieu tu form --%>
	<!-- Khi su dung cach nay du lieu null thi browser se hien thi "null" -->
	Solution 1: <br/>
	Full name is: 
	<%= request.getParameter("firstName") %>
	<%= request.getParameter("lastName") %>
	<br/>
	Country: <%= request.getParameter("country") %>
	<br/>
	Gender: <%= request.getParameter("gender") %>
	<br/>
	Favorite programing languages
	<ul>
		<%
			String[] languages = request.getParameterValues("favoriteLanguage");
			for(String language : languages){
				out.println("<li>" + language + "</li>");
			}
		%>
	</ul>
	
	<hr>
	
	<%--Cach viet tat de lay du lieu --%>
	<!-- Khi su dung cach nay du lieu null thi browser se hien thi "" -->
	Solution 2: <br/>
	Full name is: ${param.firstName } ${param.lastName } 
	<br/>
	Country: ${param.country }
	<br/>
	Gender: ${param.gender }
	<br/>
	Khong the su dung cach viet tat de lay nhieu gia tri
</body>
</html>