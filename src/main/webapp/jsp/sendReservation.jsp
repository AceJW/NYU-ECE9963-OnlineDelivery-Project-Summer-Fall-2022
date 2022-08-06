<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*" import = "objects.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>sendReview</title>
 <link rel='stylesheet' href='https://mapiac.com/wp-content/themes/mapiac/style.css'>
 <link rel="stylesheet" href="../css/sendReivew.css">
 <link
	href="../css/style.css"
	rel="stylesheet"
>
</head>
<body>
	<%
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		Statement stmt = con.createStatement();
		
		String username=request.getParameter("username");
		String restaurantName=request.getParameter("restaurantName");
		String reservationDate=request.getParameter("reservationDate");
		String reservationTime=request.getParameter("reservationTime");
		int numberOfGuest=Integer.parseInt(request.getParameter("numberOfGuest"));   
		
		if(username == null || username.equals("null")) {
			response.sendRedirect("../html/login2.html");
		}
			
		String insert = "INSERT INTO `demo`.`reservation` (`restaurantName`, `username`,`numberOfGuest`,`date`, `time`)"
				+"VALUES (?, ?, ?, ?, ?)";


		PreparedStatement ps = con.prepareStatement(insert);
		
		ps.setString(1,restaurantName);
		ps.setString(2,username);
		ps.setInt(3,numberOfGuest);
		ps.setString(4,reservationDate);
		ps.setString(5,reservationTime);
		ps.executeUpdate();
				
		con.close();
	
	

	%>
	<div class="payment-success-popup page--popup" id="payment-success">
	  <svg width="64px" height="64px" viewBox="0 0 64 64">
	      <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
	          <g id="Get-Started" transform="translate(-688.000000, -621.000000)">
	              <g id="Group-11" transform="translate(470.000000, 573.000000)">
	                  <g id="Group-2" transform="translate(218.000000, 48.000000)">
	                      <path d="M54.625,9.375 C48.374968,3.124968 40.833376,0 32,0 C23.166624,0 15.625032,3.124968 9.375,9.375 C3.1249688,15.625032 0,23.166624 0,32 C0,40.833376 3.1249688,48.374968 9.375,54.625 C15.625032,60.8750312 23.166624,64 32,64 C40.833376,64 48.374968,60.8750312 54.625,54.625 C60.875032,48.374968 64,40.833376 64,32 C64,23.166624 60.875032,15.625032 54.625,9.375 Z M51.75,51.875 C46.333304,57.2916936 39.770872,60 32.062496,60 C24.354128,60 17.750024,57.2708608 12.25,51.812496 C6.7499728,46.354136 4,39.75004 4,32 C4,24.24996 6.7499728,17.645864 12.25,12.187504 C17.750024,6.729136 24.354128,4 32.062496,4 C39.770872,4 46.354136,6.729136 51.812496,12.187504 C57.270864,17.645864 60,24.24996 60,32 C60,39.75004 57.250024,46.374976 51.75,51.875 Z" id="Page-1" fill="#ECF6FF"></path>
	                      <path d="M47.25,21 C47.083336,20.25 46.687504,19.666672 46.062496,19.25 C45.437496,18.833328 44.75,18.708336 44,18.875 C43.25,19.041664 42.625,19.458328 42.125,20.125 L28.625,40.75 L22.25,34.75 C21.666664,34.25 20.979168,34 20.187504,34 C19.395832,34 18.75,34.291664 18.25,34.875 C17.75,35.458336 17.520832,36.145832 17.562496,36.937504 C17.604168,37.729168 17.875,38.375 18.375,38.875 L27.375,47.125 C27.375,47.125 27.395832,47.145832 27.437504,47.187504 C27.479168,47.229168 27.520832,47.270832 27.562496,47.312496 C27.604168,47.354168 27.625,47.375 27.625,47.375 C27.708336,47.375 27.791664,47.395832 27.875,47.437504 C27.958336,47.479168 28,47.5 28,47.5 C28.25,47.583336 28.416664,47.666664 28.5,47.75 C28.666664,47.75 28.833336,47.75 29,47.75 C29.25,47.833336 29.458336,47.833336 29.625,47.75 C29.708336,47.75 29.791664,47.75 29.875,47.75 C30.208336,47.666664 30.5,47.541664 30.75,47.375 C30.75,47.375 30.791664,47.333336 30.875,47.25 C31.125,47.083336 31.270832,46.979168 31.312496,46.937504 C31.354168,46.895832 31.395832,46.833336 31.437504,46.75 C31.479168,46.666664 31.5,46.625 31.5,46.625 L46.875,23.125 C47.291672,22.458328 47.416664,21.75 47.25,21 Z" id="Path" fill="#7ED321"></path>
	                  </g>
	              </g>
	          </g>
	      </g>
	  </svg>
	  <h2 class="popup--title">Thank you!</h2>
	  <p class="popup--subtitle">Reservation at "<%out.print("'"+restaurantName+"' in"+reservationTime+" "+reservationDate+" with "+numberOfGuest+" people is made!");%>"</p>
	  <a href="../index.jsp?username=<%=username%>" class="btn button m-button">
		<button class="btn_1 gradient" type="submit">Go To Home Page</button></a>
	</div>
	
	
				
	<%
	} catch (Exception ex) {
		out.print(ex);
	}%>
</body>
</html>