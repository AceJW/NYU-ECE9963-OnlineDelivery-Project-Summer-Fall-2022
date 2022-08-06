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
	String foods = request.getParameter("finalOutput"); 
	String restaurantName = (String)request.getSession().getAttribute("restaurantName");
	String username = (String)request.getSession().getAttribute("username");
	if(restaurantName == null || restaurantName.equals("null")) {
		response.sendRedirect("../html/login2.html");
	}
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		Statement stmt = con.createStatement();
		
		
		
		
		java.util.Date date=new java.util.Date();
		//java.sql.Time time=new java.sql.Time(date.getTime());
		long lDate=System.currentTimeMillis();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sDate = format.format(lDate);
		
// 		out.print(sDate+"<br>");
// 		out.print(food_quality+"<br>");
// 		out.print(service+"<br>");
// 		out.print(location+"<br>");
// 		out.print(price+"<br>");
// 		out.print(avgRate+"<br>");
// 		out.print(restaurantName+"<br>");
// 		out.print(reviewTitle+"<br>");
// 		out.print(reviewContent+"<br>");
// 		out.print(username+"<br>");
		
		String insert = "INSERT INTO `demo`.`orders` (`restaurantName`, `username`, `status`, `foods`, `time`)" 
		+ "VALUES (?, ?, ?, ?, ?)";

		PreparedStatement ps = con.prepareStatement(insert);
		
		ps.setString(1,restaurantName);
		ps.setString(2,username);
		ps.setString(3,"waiting");
		ps.setString(4, foods);
		ps.setString(5, sDate);
		ps.executeUpdate();
		con.close();
		request.getSession().setAttribute("restaurantName", restaurantName);
		request.getSession().setAttribute("username", username);
		response.sendRedirect("../confirm.jsp");
	} catch (Exception ex) {
		out.print(ex);
	}%>
</body>
</html>