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
		String referer = request.getHeader("Referer");
		Cookie [] cookies =request.getCookies();
		for(Cookie cookie: cookies) {
			if((cookie.getName().indexOf("nyufoodproject"))!=-1){//find special format cookie 
				response.sendRedirect(referer);
			}
		}
		response.sendRedirect("../html/login2.html");
	%>
</body>
</html>