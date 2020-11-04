<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="theLocale"
		value="${not empty param.theLocale ? param.theLocale : pageContext.request.locale }"
		scope="session"/>
<fmt:setLocale value="${param.theLocale }"/>
<fmt:setBundle basename="i18n.resources.for_i18n" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<p style="font-weight:bold;">
		Default language used in this Server: 
		<span style="color:green;"><%= request.getLocale() %></span>
	</p> 

	<a href="main.jsp?theLocale=en_US">English (US)</a>
	|
	<a href="main.jsp?theLocale=es_ES">Spanish (ES)</a>
	|
	<a href="main.jsp?theLocale=de_DE">German (DE)</a>
	
	<hr>
	
	<fmt:message key="greeting" />
	<br/><br>
	<fmt:message key="firstName" />: Trung 
	<br>
	<fmt:message key="lastName" />: Van 
	<br>
	<fmt:message key="welcome" />
	
	<hr>
	Selected locale: ${theLocale }
	
</body>
</html>
