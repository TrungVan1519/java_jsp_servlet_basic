<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Choosing languages</title>
	<%
		//TODO: Lay ra danh sach lua chon cua user de luu vao Cookies
		String[] cookieLanguages = request.getParameterValues("language");
		
		if(cookieLanguages != null){
			// TODO: Lam viec voi Cookies
			for(int i = 0; i < cookieLanguages.length; i++){
				// TODO: Tao Cookie
				Cookie cookie = new Cookie("myApp.language" + i, cookieLanguages[i]);
				cookie.setMaxAge(60*60*24*365); // <= 1 nam
						

				// TODO: Gui Cookie ve homepage.jsp
				response.addCookie(cookie);
			}
		} 
	%>
</head>
<body>
	<form action="choosing_languages.jsp">
		Select your favorite languages
		<input type="checkbox" name="language" value="Java"/>Java
		<input type="checkbox" name="language" value="CSharp"/>C#
		<input type="checkbox" name="language" value="Python"/>Python
		<input type="checkbox" name="language" value="Javascript"/>Javascript
		
		<br/>
		<input type="submit" value="Click to confirm"/>
	</form>
	
	<%
		// TODO: Show du lieu trong session, neu du lieu khong co thi tao moi
		List<String> items = (List<String>) session.getAttribute("items");
		if(items == null){
			items = new ArrayList<String>();
			session.setAttribute("items", items);
		}

		// TODO: Lay ra danh sach lua chon cua user roi luu vao session
		String[] choosenLanguage = request.getParameterValues("language");
		if(choosenLanguage != null){
			items.clear();
			for(String language : choosenLanguage){
				items.add(language);
			}
		}

		// TODO: In danh sach items ra choosing_fav_languages.jsp
		out.print("My favorite laguage list:");
		out.print("<ol>");
		for(String item : items){
			out.print("<li>" + item + "</li>");
		}
		out.print("</ol>");
	%>
	
	<hr/>
	<a href="homepage.jsp">Return homepage.jsp</a>
	
</body>
</html>