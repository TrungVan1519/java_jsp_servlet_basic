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
		String favoriteLanguage = "Java";
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("myApp.favoriteLanguage")){
					favoriteLanguage = cookie.getValue();
					break;
				}
			}
		}
	%>
	
	Something new about <%= favoriteLanguage %><br/>
	<a href="cookie_personalize_form.jsp">Choose language</a>
</body>
</html>
