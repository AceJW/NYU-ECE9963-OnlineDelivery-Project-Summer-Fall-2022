<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body><%
		Cookie [] cookies =request.getCookies();
		for(Cookie cookie: cookies){
			if((cookie.getName().indexOf("food"))!=-1){
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
		response.sendRedirect("../html/login2.html");
		%>
</body>
</html>