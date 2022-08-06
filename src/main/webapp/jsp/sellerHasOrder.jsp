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
    Your Past Orders!   	
  </h2>

	<div class="scroll-window">
	<table class="table table-striped table-hover user-list fixed-header">
		<thead>
		
			
			<th><div>Restaurant</div></th>
			<th><div>Status</div></th>
			<th><div>Foods</div></th>
			<th><div>Time</div></th>
		</thead>
		<tbody>
			<%
			String referer = request.getHeader("Referer");
			if(referer == null) {
				response.sendRedirect("../html/login2.html");
			} else if((referer.indexOf("sellerDashboard.jsp")==-1)) {
				response.sendRedirect("../html/login2.html");
			}
			String restaurant=request.getParameter("restaurant");
// 			if(restaurant==null) restaurant = "seller1nyu";
			
		try {
			 
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form
// 			if(username == null) username = "tom";
			ResultSet rs = null;
			
			String query = "SELECT * FROM demo.orders where restaurantName='"+restaurant+"' order by status DESC";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(query);

			//Run the query against the DB
			rs = ps.executeQuery();

			//Make an insert statement for the login in blanks:

			while(rs!= null && rs.next()) {	
				String id = rs.getString("id");
				String restaurantName = rs.getString("restaurantName");
				String status  = rs.getString("status");
				String foods = rs.getString("foods");
				String time = rs.getString("time");
				if(status.equals("waiting")) {
					%>
					
						<tr>
						
							<td><%=restaurantName%></td>
							<td><%=status%></td>
							<td><%=foods%></td>
							<td><%=time%></td>
							<form method="post" action="rejectOrder.jsp?restaurant=<%=restaurant%>&id=<%=id%>">
							<td class="text-right">
								<!-- <button class="button tiny">View User</button> -->
								<button class="button alert tiny">Reject</button>			
							</td>
							</form>
							<form method="post" action="acceptOrder.jsp?restaurant=<%=restaurant%>&id=<%=id%>">
							<td class="text-right">
								<!-- <button class="button tiny">View User</button> -->
								<button class="button alert tiny">Accept</button>			
							</td>
							</form>
						</tr>
					
					<%} 
					else {%>
						<tr>		
							<td><%=restaurantName%></td>
							<td><%=status%></td>
							<td><%=foods%></td>
							<td><%=time%></td>
						</tr>
					<%} %>
				<%} %>
				
		
 		</tbody>
	</table>
	</div>
</div>
</div>
</div>
</div>
<!-- partial -->	
<div>
	
	
	<form method="post" action="../sellerDashboard.jsp?username=<%=request.getParameter("username")%>">
    	
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