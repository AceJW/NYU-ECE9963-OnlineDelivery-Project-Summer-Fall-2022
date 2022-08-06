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
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form
			String username = request.getParameter("username");
			
			if(username == null || username.equals("null")) {
				response.sendRedirect("../html/login2.html");
				//username = "marry";
			}
			String sendNewMessage = request.getParameter("sendNewMessage");
			
			if(sendNewMessage != null) {
				
				java.util.Date date=new java.util.Date();
				java.sql.Time time=new java.sql.Time(date.getTime());
				String insert = "INSERT INTO ConversationsWithRepresentative(sendFrom, sendTo, message)"
						+ "VALUES (?, ?, ?)";
				PreparedStatement ps3 = con.prepareStatement(insert);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps3.setString(1, username);
				ps3.setString(2, "cr");
				ps3.setString(3, sendNewMessage);
				ps3.executeUpdate();
			}
			
			ResultSet rs = null;
			if(username != null) {
				String query = "SELECT * FROM ConversationsWithRepresentative WHERE sendFrom = ? or sendTo = ?";
				
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(query);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, username);
				ps.setString(2, username);
				//Run the query against the DB
				rs = ps.executeQuery();
			}
			//Make an insert statement for the login in blanks:
			
			boolean loggedIn = false;
			ArrayList<Message> messages = new ArrayList<>();
			while(rs!= null && rs.next()) {
				messages.add(new Message(rs.getString("sendFrom"), rs.getString("message")));
			}
			
				
			MessageList ml = new MessageList(messages);
			
			con.close();
			
			request.getSession().setAttribute("messages", ml);
			response.sendRedirect("AskQuestion.jsp?username="+username);

				
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
		}
	%>
</body>
</html>