<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*" import = "objects.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%	String referer = request.getHeader("Referer");
		String id = request.getParameter("id");
		if(referer == null) {
			response.sendRedirect("../html/login2.html");
		} else if((referer.indexOf("adminPage.jsp"))==-1) {
			response.sendRedirect("../html/login2.html");
		}
		
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String query = "Delete FROM restaurantRate WHERE id = ?";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(query);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, id);
			//Run the query against the DB
			ps.executeUpdate();

			con.close();
			
			request.getSession().setAttribute("role", "admin");
			response.sendRedirect("adminPage.jsp");

			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
		}
	%>
</body>
</html>