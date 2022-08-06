<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="connection.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
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
		} else if((referer.indexOf("sellerDashboard.jsp")==-1)) {
			response.sendRedirect("../html/login2.html");
		} else {
			try {
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();

				//Create a SQL statement
				Statement stmt = con.createStatement();
				String restaurantName = request.getParameter("restaurantName");
// 				if(restaurantName == null) restaurantName = "Ace Home";
				//Get parameters from the HTML form at the index.jsp
				String username = request.getParameter("username");
				String isReserved = (String)request.getSession().getAttribute("isReserved");
				//Make an insert statement for the Sells table:
				String update = "update restaurant set openReservation = ? where restaurantName = ?";
				

				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(update);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				if(isReserved.equals("open")) {
					ps.setString(1, "close");
				} else {
					ps.setString(1, "open");
				}
				ps.setString(2, restaurantName);	

				ps.executeUpdate();
				
				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
				con.close();
				request.getSession().setAttribute("role", "seller");
				response.sendRedirect("../sellerDashboard.jsp?username="+username);
				//out.print("Username exist!");
			} catch (Exception ex) {
				out.print(ex.getMessage());
				/* response.sendRedirect("../html/login2.html"); */
				//out.print("Username exist!");
			}
		}
		
		
	%>
</body>
</html>