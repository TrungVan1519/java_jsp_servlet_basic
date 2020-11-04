<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:set var="data" value="abc xyz"/>
	1 so ham tuong tac voi <b>${data }</b>
	<ol>
		<li>function length: 		${fn:length(data) }</li>
		<li>function toUpperCase:	${fn:toUpperCase(data) }</li>
		<li>function startsWith:	${fn:startsWith(data, "abc") }</li>
		<li>function split:
			<br>// Cach 1:	
			<c:set var="arrString" value="${fn:split(data, ' ') }"></c:set>
			<c:forEach var="element1" items="${arrString }">
				<br>${element1 }
			</c:forEach>
			
			<br>// Cach 2:
			<c:forEach var="element2" items="${fn:split(data, ' ') }">
				<br>${element2 }
			</c:forEach>
		</li>
		<li>function join:
			<br>// Cach 1:
			<c:set var="varString" value="${fn:join(arrString, '~') }"/>
			${varString }
			
			<br>// Cach 2:
			${fn:join(fn:split(data, ' '), "***") }
		</li>
	</ol>
</body>
</html>