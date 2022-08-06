<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*" import = "objects.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>userReservation</title>
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
    Your Reservation!   	
  </h2>

	<div class="scroll-window">
	<table class="table table-striped table-hover user-list fixed-header">
		<thead>
		
			<th><div>ID</div></th>
			<th><div>Restaurant</div></th>
			<th><div>User</div></th>
			<th><div>Guest</div></th>
			<th><div>Date</div></th>
			<th><div>Time</div></th>
		</thead>
		<tbody>
			<%
			String username=request.getParameter("username");
			
			Cookie [] cookies =request.getCookies();
			if(cookies!=null){
				for(Cookie cookie: cookies){
					if((cookie.getName().indexOf("nyufoodproject"))!=-1){//find special format cookie 
						username=cookie.getName().substring(14);
						out.print(username+", ");
					}
				}
			}
			if(username == null || username.equals("null")){
				username = request.getParameter("username");
				if(username==null || username.equals("null")){
					out.print("Not Login, ");
				}else{
					out.print(username+", ");
				}
			}
			
		try {
			 
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form
	
			ResultSet rs = null;
			
			String query = "SELECT * FROM demo.reservation where username='"+username+"'";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(query);

			//Run the query against the DB
			rs = ps.executeQuery();

			//Make an insert statement for the login in blanks:

			while(rs!= null && rs.next()) {	
				int id = rs.getInt("idreservation");
				String restaurantName = rs.getString("restaurantName");
				int numberOfGuest  = rs.getInt("numberOfGuest");
				String reservationDate = rs.getString("date");
				String reservationTime= rs.getString("time");
				
		%>
		<form method="post" action="deleteReservation.jsp?username=<%=username%>&id=<%=id%>">
			<tr>
				<td><%=id%></td>
				<td><%=restaurantName%></td>
				<td><%=username%></td>
				<td><%=numberOfGuest%></td>
				<td><%=reservationDate%></td>
				<td><%=reservationTime%></td>
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
<!-- partial -->	
<div>
	
	
	<form method="post" action="../index.jsp?username=<%=username%>">
    	
		<button class="button alert tiny">Go back</button>	
	</form>	
</div>
	<% 
		con.close();
	} catch (Exception ex) {
		out.print(ex);
	} %>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</body>
</html>
