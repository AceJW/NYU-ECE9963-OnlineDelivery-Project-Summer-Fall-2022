<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*" import = "objects.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CodePen - Chat Interface Concept</title>
  <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300' rel='stylesheet' type='text/css'>

<script src="https://use.typekit.net/hoy3lrg.js"></script>
<script>try{Typekit.load({ async: true });}catch(e){}</script><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'><link rel="stylesheet" href="../css/cr.css">

</head>
<body>
<!-- partial:index.partial.html -->
<!-- 

A concept for a chat interface. 

Try writing a new message! :)


Follow me here:
Twitter: https://twitter.com/thatguyemil
Codepen: https://codepen.io/emilcarlsson/
Website: http://emilcarlsson.se/

-->

<div id="frame">
	<div id="sidepanel">
		<div id="profile">
			<div class="wrap">
				<img id="profile-img" src="../img/cr.png" class="online" alt="" />
				<p>Customer Representative</p>
<!-- 				<i class="fa fa-chevron-down expand-button" aria-hidden="true"></i> -->
<!-- 				<div id="status-options"> -->
<!-- 					<ul> -->
<!-- 						<li id="status-online" class="active"><span class="status-circle"></span> <p>Online</p></li> -->
<!-- 						<li id="status-away"><span class="status-circle"></span> <p>Away</p></li> -->
<!-- 						<li id="status-busy"><span class="status-circle"></span> <p>Busy</p></li> -->
<!-- 						<li id="status-offline"><span class="status-circle"></span> <p>Offline</p></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 				<div id="expanded"> -->
<!-- 					<label for="twitter"><i class="fa fa-facebook fa-fw" aria-hidden="true"></i></label> -->
<!-- 					<input name="twitter" type="text" value="mikeross" /> -->
<!-- 					<label for="twitter"><i class="fa fa-twitter fa-fw" aria-hidden="true"></i></label> -->
<!-- 					<input name="twitter" type="text" value="ross81" /> -->
<!-- 					<label for="twitter"><i class="fa fa-instagram fa-fw" aria-hidden="true"></i></label> -->
<!-- 					<input name="twitter" type="text" value="mike.ross" /> -->
<!-- 				</div> -->
			</div>
		</div>
<!-- 		<div id="search"> -->
<!-- 			<label for=""><i class="fa fa-search" aria-hidden="true"></i></label> -->
<!-- 			<input type="text" placeholder="Search contacts..." /> -->
<!-- 		</div> -->
		<div id="contacts">
			<ul>
			
			 <%
			String role = (String)request.getSession().getAttribute("role");
			if((role == null || !role.equals("cr"))) {
				response.sendRedirect("../html/login2.html");
			}
			 MessageList ml = (MessageList)request.getSession().getAttribute("messages");
			 DialogueList dl = (DialogueList)request.getSession().getAttribute("customers");
			 ArrayList<String> dialogues = dl.dialogues;
			 for(int i = 0; i < dialogues.size(); i++) { String username = dialogues.get(i); %>
				
				<li class="contact">
					<div class="wrap" onclick="location.href = 'dialogueProcess.jsp?username=<%=username%>'" style="cursor:pointer">
						<span class="contact-status online"></span>
						<img src="../img/avatar.jpg" alt="" />
						<div class="meta">
							<p class="name"><%=username %></p>
							<p class="preview">New Message</p>
						</div>
					</div>
				</li>
				<% }%>
			</ul>
		</div>
		<div id="bottom-bar">
<!-- 			<button id="addcontact"><i class="fa fa-user-plus fa-fw" aria-hidden="true"></i> <span>Logout</span></button> -->
			<form method="post" action="../html/login2.html">
				<button id="settings"><i class="fa fa-cog fa-fw" aria-hidden="true"></i> <span>Logout</span></button>
			</form>
		</div>
	</div>
	<div class="content">
		<div class="contact-profile">
			<img src="../img/cr.png" alt="" />
			<p>Dialogue</p>
			<div class="social-media">
<!-- 				<i class="fa fa-facebook" aria-hidden="true"></i> -->
<!-- 				<i class="fa fa-twitter" aria-hidden="true"></i> -->
<!-- 				 <i class="fa fa-instagram" aria-hidden="true"></i> -->
			</div>
		</div>
		<div class="messages">
			<ul>
				<% 
				ArrayList<Message> messages = ml.messages; 
				for(int i = 0; i < messages.size(); i++) {
					String sender = "sent";
					if(!messages.get(i).sender.equals("cr")) {
						sender = "replies";
					}
					String message = messages.get(i).message;
					if(sender.equals("sent")) {
							%>	
							
							<li class=<%=sender%>>
								<img src="../img/cr.png" alt="" />
								<p><%=message %></p>
							</li>
						<%
						} else {
						
						%>	
						
							<li class=<%=sender%>>
								<img src="../img/avatar.jpg" alt="" />
								<p><%=message %></p>
							</li>
						<%
					}
				}
				%>
				
				
			</ul>
		</div>
		<form method="post" action="dialogueProcess.jsp?username=<%=request.getParameter("username")%>">
		<%request.getSession().setAttribute("role", "cr"); %>
		<div class="message-input">
			<div class="wrap">
			<input type="text" name="sendNewMessage" placeholder="Write your message..." />
<!-- 			<i class="fa fa-paperclip attachment" aria-hidden="true"></i> -->
			<button class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
			</div>
		</div>
		</form>
	</div>
</div>
<!-- partial -->
  <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script><script  src="../js/cr.js"></script>

</body>
</html>
