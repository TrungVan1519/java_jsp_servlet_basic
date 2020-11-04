<%@page import="com.example.model.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:set var="datetime" value="<%= new Date() %>"></c:set>
	Time now: <br/> ${datetime } <br/>
	<c:out value="${datetime }"></c:out>
	
	<hr/>
	<%
		List<Person> people = new ArrayList<Person>();
		people.add(new Person("Steve Roger", 80, false));
		people.add(new Person("Tony Stark", 40, true));
		request.setAttribute("people", people);
		/* pageContext.setAttribute("people", people); */
	%>
	forEach Tag:<br/>
	<table border="1">
		<tr>
			<th>Full name</th>
			<th>Age</th>
			<th>Customer Type</th>
		</tr>
		<c:forEach var="person" items="${people }">
			<tr>
				<td>${person.fullName }</td>
				<td>${person.age }</td>
				<td>
					<c:if test="${person.layRaThuocTinhGoldCustomer() }">
						<em style="color: green">Gold customer</em>
					</c:if>
					<c:if test="${not person.layRaThuocTinhGoldCustomer() }">
						<em style="color: red">Normal customer</em>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<hr/>
	<table border="1">
		<tr>
			<th>Full name</th>
			<th>Age</th>
			<th>Customer Type</th>
		</tr>
		<c:forEach var="person" items="${people }">
			<tr>
				<td>${person.fullName }</td>
				<td>${person.age }</td>
				<td>
					<c:choose>
						<c:when test="${person.layRaThuocTinhGoldCustomer() }">
							<span style="color: green">Gold customer</span>
						</c:when>
						<c:otherwise>
							<span style="color: red">Normal customer</span>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>