<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();
		
		if(cookies == null){
			out.print("There is no infomation.<br/>");
		} else {
			for(Cookie cookie : cookies){
				if(cookie.getName().contains("myApp.language")){
					out.print("<h3>" + cookie.getValue() + "</h3>");
				}
			}
		}
	%>
	
	<a href="choosing_languages.jsp">Choose language</a>
</body>
</html>
