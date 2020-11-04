<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	This file is created by <%= new Date() %>
	
	<hr>
	<h3>JSP Expression:</h3>
	<ul>
		<li>
			Gọi các biểu thức tính toán, lấy ngày giờ, xử lý String, gọi hàm trong 
		<b>JSP Declaration</b>
		</li>
		<li>
			Kết quả trả về tự động được included vào HTML và hiển thị cho Browser nên
			không cần sử dụng <b>";"</b>
		</li>
	</ul>
	Convert a "string" to upper: <%= "string".toUpperCase() %> <br>
	25 * 4 = <%= 25 * 4 %> </br>
	Is 75 less than 69? <%= 75 < 69 %>
	
	<hr>
	<h3>JSP Declaration: </h3>
	<ul>
		<li>
			Là các đoạn khai báo biến và hàm trong Java
		</li>
		<li>
			Kết hợp với JSP Expression gọi hàm trong JSP Declaration để kết quả trả về 
			được included vào HTML
		</li>
	</ul>
	<%!
		String s = "HELLO WORLD";
		String makeItLower(){
			return s.toLowerCase();
		}
	%>
	Result called by JSP Expression "<%= s %>": <%= makeItLower() %>
	
	<hr>
	<h3>JSP Scriptlet</h3>
	<ul>
		<li>
			Là các đoạn code Java không phải khai báo hàm như loop, if-else, ...
		</li>
		<li>
			Kết quả trả về muốn được included vào HTML phải kết hợp cùng build-in obj
			out thông qua câu lệnh: "out.println(...);"
		</li>
		<li>
			JSP Scriptlet + build-in obj out == JSP Declaration + JSP Expression
	</ul>
	<% 
		String s = "HELLO WORLD";
		for(int i = 0; i < 1; i++){
			out.print(s + ": " + s.toLowerCase());
		}
	%>

</body>
</html>