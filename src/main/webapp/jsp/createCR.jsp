<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="../css/loginStyle.css">

</head>
<body>
<%		String referer = request.getHeader("Referer");
		String role = (String)request.getSession().getAttribute("role");
		if(referer == null) {
			response.sendRedirect("../html/login2.html");
		} else if((referer.indexOf("createAccount.jsp"))==-1 && (role == null || !role.equals("admin"))) {
			response.sendRedirect("../html/login2.html");
		}
	%>
<!-- partial:index.partial.html -->
<!-- Mixins-->
<!-- Pen Title-->
<div class="pen-title">
  <h1>Create CR Account!</h1>
</div>

<div class="container">
  <div class="card"></div>
  <div class="card">
    <h1 class="title">Register</h1>
    
     
     
    <form method="post" action="createAccount.jsp">
      <div class="input-container">
        <input type="email"  name = "email" required="required"/>
        <label >E-Mail</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input name="username" required="required"/>
        <label >Username</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input name="password" required="required"/>
        <label >Password</label>
        <div class="bar"></div>
      </div>
     
      <div class="button-container">
        <button><span>Submit</span></button>
      </div>
      
    </form>
     <form method="post" action="adminPage.jsp">
		<div class="button-container">
	      	<% request.getSession().setAttribute("role", "admin");%>
	        <button><span>Back</span></button>
	      </div>
	  </form>
  </div>
 
</div>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script  src="../js/loginScript.js"></script>

</body>
</html>