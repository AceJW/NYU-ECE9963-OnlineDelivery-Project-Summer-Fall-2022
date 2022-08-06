<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
		try {
			 
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form
			String email = request.getParameter("email");
			String username = request.getParameter("username");
	
			//Make an insert statement for the login in blanks:
			String query = "SELECT * FROM users WHERE username = ? AND email = ?";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(query);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, username);
			ps.setString(2, email);
			//Run the query against the DB
			ResultSet rs = ps.executeQuery();
			
			boolean loggedIn = false;
			String password = null;
			while(rs.next()) {
				
				loggedIn = !rs.wasNull();
				if(loggedIn)
					password = "Your password is: " + rs.getString("password");
			}
			
			if (loggedIn) {
				
				con.close();
				%>
					<script type="text/javascript"> alert("<%=password %>"); 
						window.location = "../html/login2.html"; 
					</script>		
				
				<%
			} else {
				%>
				<script type="text/javascript"> alert("Email Or Password Wrong!"); 
					window.location = "../html/forgotPassword.html"; 
				</script>		
			
				<%
			}

			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
		}
	%>
</body>
</html>