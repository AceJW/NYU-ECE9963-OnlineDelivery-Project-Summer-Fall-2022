<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*" import = "objects.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminPage</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://cdn.jsdelivr.net/foundation/5.0.2/css/foundation.min.css'><link rel="stylesheet" href="../css/adminPage.css">

</head>
<body>



<!-- partial:index.partial.html -->
<div id="bodywrap">
<div class="row">
<div class="large-10 columns">
  <div class="scroll-window-wrapper">
  <h2>
    Admin Dashboard<br>
    <small>All Accounts</small> 
    	
  </h2>
	<div class="scroll-window">
	<table class="table table-striped table-hover user-list fixed-header">
		<thead>
			<th><div>Name</div></th>
			<th><div>Email</div></th>
			<th><div>Role</div></th>
			<th><div></div></th>
		</thead>
		<tbody>
			<%
			
		String role = (String)request.getSession().getAttribute("role");
		String referer = request.getHeader("Referer");
		if(referer == null) {
			response.sendRedirect("../html/login2.html");
		} else if((role == null || !role.equals("admin"))) {
			response.sendRedirect("../html/login2.html");
		}
		try {
			 
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form
			
			
			ResultSet rs = null;
			
			String query = "SELECT * FROM users WHERE username != 'admin' order by role";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(query);

			//Run the query against the DB
			rs = ps.executeQuery();
			
			//Make an insert statement for the login in blanks:
			
			boolean loggedIn = false;
			while(rs!= null && rs.next()) {				
			String username = rs.getString("username");
			String email = rs.getString("email");
			String userRole  = rs.getString("role");
		%>
		<form method="post" action="deleteAccount.jsp?username=<%=username%>">
			<tr>
				<td><%=username%></td>
				<td><%=email%></td>
				<td><%=userRole%></td>
				<td class="text-right">
					<!-- <button class="button tiny">View User</button> -->
					<button class="button alert tiny">Delete</button>			
				</td>
			</tr>
		</form>
			<%} %>
 		</tbody>
	</table>
	
	</div>
	<form method="post" action="createCR.jsp">
    	<% request.getSession().setAttribute("role", "admin");%>
    	
		<button class="button alert tiny">Create CR Account</button>	
	</form>	
	
</div>
</div>
</div>
</div>
<!-- partial -->

<!-- partial:index.partial.html -->
<div id="bodywrap">
<div class="row">
<div class="large-10 columns">
  <div class="scroll-window-wrapper">
  <h2>
    <small>All Comments & Rates</small> 
  </h2>
	<div class="scroll-window">
	<table class="table table-striped table-hover user-list fixed-header">
		<thead>
			<th><div>restaurant</div></th>
			<th><div>username</div></th>
			<th><div>rate</div></th>
			<th><div>title</div></th>
			<th><div>content</div></th>
		</thead>
		<tbody>
			<%
		
			 
			//Get the database connection
		

			//Get parameters from the HTML form
			
			
			ResultSet rs2 = null;
			
			String query2 = "SELECT * FROM restaurantRate order by restaurantName";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps2 = con.prepareStatement(query2);

			//Run the query against the DB
			rs2 = ps2.executeQuery();
			
			//Make an insert statement for the login in blanks:
			
			while(rs2!= null && rs2.next()) {	
				String id = rs2.getString("id");
				String restaurantName = rs2.getString("restaurantName");
				String username = rs2.getString("username");
				String rate = rs2.getString("rate");
				String title  = rs2.getString("title");
				String content  = rs2.getString("content");
		%>
		<form method="post" action="deleteComments.jsp?id=<%=id%>">
			<tr>
				<td><%=restaurantName%></td>
				<td><%=username%></td>
				<td><%=rate%></td>
				<td><%=title%></td>
				<td><%=content%></td>
				<td class="text-right">
					<!-- <button class="button tiny">View User</button> -->
					<button class="button alert tiny">Delete</button>			
				</td>
			</tr>
		</form>
			<%}%>
 		</tbody>
	</table>
	
	
	</div>
	
</div>
</div>
</div>
</div>

<!-- partial:index.partial.html -->
<div id="bodywrap">
<div class="row">
<div class="large-10 columns">
  <div class="scroll-window-wrapper">
  <h2>
    <small>All Orders</small> 
  </h2>
	<div class="scroll-window">
	<table class="table table-striped table-hover user-list fixed-header">
		<thead>
			<th><div>username</div></th>
			<th><div>restaurant name</div></th>
			<th><div>status</div></th>
			<th><div>foods</div></th>
			<th><div>time</div></th>
		</thead>
		<tbody>
			<%
		
			 
			//Get the database connection
		

			//Get parameters from the HTML form
			
			
			ResultSet rs3 = null;
			
			String query3 = "SELECT * FROM orders order by username";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps3 = con.prepareStatement(query3);

			//Run the query against the DB
			rs3 = ps3.executeQuery();
			
			//Make an insert statement for the login in blanks:
			
			while(rs3!= null && rs3.next()) {	
				String username = rs3.getString("username");
				String restaurantName = rs3.getString("restaurantName");
				String status = rs3.getString("status");
				String foods  = rs3.getString("foods");
				String time  = rs3.getString("time");
		%>
			<tr>
				<td><%=username%></td>
				<td><%=restaurantName%></td>
				<td><%=status%></td>
				<td><%=foods%></td>
				<td><%=time%></td>
			</tr>
			<%}%>
 		</tbody>
	</table>
	
	
	</div>
	
	
	<form method="post" action="../html/login2.html">
    	
		<button class="button alert tiny">Logout</button>	
	</form>	
</div>
</div>
</div>
</div>	
	<% 
		con.close();
	} catch (Exception ex) {
		out.print(ex);
	} %>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</body>
</html>
