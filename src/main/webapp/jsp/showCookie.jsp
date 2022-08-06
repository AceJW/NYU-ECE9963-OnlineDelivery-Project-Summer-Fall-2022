<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<p>Welcome User
	<%	
		String username = request.getParameter("username");
		Cookie [] cookies =request.getCookies();
		for(Cookie cookie: cookies){
			if(cookie.getName().equals(username)){
				out.print(username);
			}
		}
		%>
		
		<form method="post" action="logOut.jsp">
		<br>
			<input type="submit" value="Log out">
		<br />
		</form>
		
	</p>
</body>
</html>