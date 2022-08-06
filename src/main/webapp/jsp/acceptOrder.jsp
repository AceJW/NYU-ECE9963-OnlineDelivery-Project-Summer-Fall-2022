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
	<%
	String referer = request.getHeader("Referer");
	if(referer == null) {
		response.sendRedirect("../html/login2.html");
	} else if((referer.indexOf("sellerHasOrder.jsp")==-1)) {
		response.sendRedirect("../html/login2.html");
	} else {
		try {
			String id = request.getParameter("id");
			String restaurant = request.getParameter("restaurant");
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String query = "update orders set status = ? WHERE id = ?";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(query);
		
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, "shipping");
			ps.setString(2, id);
			//Run the query against the DB
			ps.executeUpdate();
		
			con.close();
			
			response.sendRedirect("sellerHasOrder.jsp?username="+request.getParameter("restaurant"));
		
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
		}
	}
	%>
</body>
</html>