<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- Step 1: Tao form -->
	<form action="interact_with_session.jsp">
		Add new item:
		<input type="text" name="txtItem"/>
		<input type="submit" value="Click to confirm"/>
	</form>
	<hr/>
	
	<!-- Step 2: Luu du lieu vao session -->
	<% 
		List<String> items = (List<String>) session.getAttribute("myToDoList");
	
		if(items == null){
			items = new ArrayList<String>();
			session.setAttribute("myToDoList", items);
			out.print(session.getId());
		}
		
		String item = request.getParameter("txtItem");
		if(item != null){
			items.add(item);
		}
	%>
	
	<!-- Step 3: Hien thi luon du lieu trong cung 1 trang -->
	<em>My to-do list:</em>
	<ol>
		<%
			for(String i : items){
				out.print("<li>" + i + "</li>");
			}
		%>
	</ol>
</body>
</html>