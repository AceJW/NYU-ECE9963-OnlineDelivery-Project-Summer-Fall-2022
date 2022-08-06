<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*" import = "objects.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>deletReservation</title>
</head>
<body>
	<%	String username = request.getHeader("username");
		String id = request.getParameter("id");
		String referer = request.getHeader("Referer");
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String query = "Delete FROM demo.reservation WHERE idreservation = ?";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(query);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, id);
			//Run the query against the DB
			ps.executeUpdate();

			con.close();
			if(referer.indexOf("user")!=-1){
				response.sendRedirect("userReservation.jsp?="+username+"");
			}else{
				response.sendRedirect("sellerReservation.jsp?="+username+"");
			}
			

			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
		}
	%>
</body>
</html>