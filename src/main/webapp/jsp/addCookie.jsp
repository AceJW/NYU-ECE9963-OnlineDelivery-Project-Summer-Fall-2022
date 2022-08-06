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
	 Cookie cookie = new Cookie("book","English");
	 response.addCookie(cookie);
	 response.sendRedirect("getCookie.jsp");
	%>
</body>
</html>