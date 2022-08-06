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
	<%String command=""; %>
	<form method="post" action="labelTest.jsp?username=<%out.print("123");%>">
	    <!-- note the show.jsp will be invoked when the choice is made -->
		<!-- The next lines give HTML for radio buttons being displayed -->
	  <input type="radio" name="command" value="beers">Let's have a beer! Click here to see the beers.
	  <br>
	  <input type="radio" name="command" value="bars"/>Let's go to a bar! Click here to see the bars.
	    <!-- when the radio for bars is chosen, then 'command' will have value 
	     | 'bars', in the show.jsp file, when you access request.parameters -->
	  <br>
		<div class="col-lg-2">
			<button
				class="btn_1 gradient"
				type="submit"
			>Search</button>
		</div>
	</form>
	<%
	String restaurantName=request.getParameter("restaurantName");
	String username = request.getParameter("username");
	String categories=request.getParameter("categories");
    String address=request.getParameter("address");
    String city=request.getParameter("city");
    String country=request.getParameter("country");
    float rate=0;
    java.util.Date date=new java.util.Date();
    long lDate=System.currentTimeMillis();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String sDate = format.format(lDate);
	
	String filter=request.getParameter("filter");
	out.print(filter+"<br>");
    out.print(restaurantName+"<br>");
	out.print(categories+"<br>");
	out.print(address+"<br>");
	out.print(city+"<br>");
	out.print(country+"<br>");
// 	command=request.getParameter("command");
// 	String username=request.getParameter("username");
// 	String filter=request.getParameter("filter");
// 	out.print(command+"<br>");
// 	out.print(username+"<br>");
// 	out.print(filter+"<br>");
	%>
</body>
</html>