<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="connection.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>createAccount</title>
</head>
<body>
	<%
		String referer = request.getHeader("Referer");
		if(referer == null) {
			response.sendRedirect("../html/login2.html");
		} else if((referer.indexOf("editUserProfile.jsp")==-1)) {
			response.sendRedirect("../html/login2.html");
		} else {
			String username = "";
			try {
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();

				//Create a SQL statement
				Statement stmt = con.createStatement();
				username = (String)request.getSession().getAttribute("oldusername");
				//Get parameters from the HTML form at the index.jsp
				String newUsername = request.getParameter("username");
				String communities = request.getParameter("communities");
				String address = request.getParameter("address");
				String zipcode = request.getParameter("zipcode");
				String photoURL = request.getParameter("photoURL");
				//Make an insert statement for the Sells table:
				String update = "update users set username = ?, communities = ?, address = ?, imgUrl = ?, zipcode = ? where username = ?";
				

				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(update);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, newUsername);
				ps.setString(2, communities);
				ps.setString(3, address);
				ps.setString(4, photoURL);
				ps.setString(5, zipcode);
				ps.setString(6, username);	
					

				ps.executeUpdate();
				
				response.sendRedirect("../html/login2.html");
				//out.print("Username exist!");
			} catch (Exception ex) {
				%>			
				<script type="text/javascript">
				 alert("Email or Username exist!");
				 window.location = "../editUserProfile.jsp?username=<%=username%>";
				 </script>
				<%

				out.print(ex.getMessage());
				/* response.sendRedirect("../html/login2.html"); */
				//out.print("Username exist!");
			}
		}
		
		
	%>
	
			<form method="get" action="../html/login2.html">
<!-- 			<br> -->
<!-- 				<input type="submit" value="Back to Login Page"> -->
<!-- 			<br /> -->
		</form>


</body>
</html>