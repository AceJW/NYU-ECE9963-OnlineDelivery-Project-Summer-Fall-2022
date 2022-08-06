<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*" import = "objects.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>sellerDashboard</title>

<head>
<meta charset="utf-8">
<meta
	http-equiv="X-UA-Compatible"
	content="IE=edge"
>
<meta
	name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no"
>
<meta
	name="description"
	content="FooYes - Quality delivery or takeaway food"
>
<meta
	name="author"
	content="Ansonika"
>

<link
	rel="shortcut icon"
	href="img/favicon1.ico"
	type="image/x-icon"
>
<link
	rel="apple-touch-icon"
	type="image/x-icon"
	href="img/apple-touch-icon-57x57-precomposed.png"
>
<link
	rel="apple-touch-icon"
	type="image/x-icon"
	sizes="72x72"
	href="img/apple-touch-icon-72x72-precomposed.png"
>
<link
	rel="apple-touch-icon"
	type="image/x-icon"
	sizes="114x114"
	href="img/apple-touch-icon-114x114-precomposed.png"
>
<link
	rel="apple-touch-icon"
	type="image/x-icon"
	sizes="144x144"
	href="img/apple-touch-icon-144x144-precomposed.png"
>
<!-- GOOGLE WEB FONT -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&display=swap"
	rel="stylesheet"
>
<!-- BASE CSS -->
<link
	href="css/bootstrap_customized.min.css"
	rel="stylesheet"
>
<link
	href="css/style.css"
	rel="stylesheet"
>
<!-- SPECIFIC CSS -->
<link
	href="css/detail-page.css"
	rel="stylesheet"
>
<!-- YOUR CUSTOM CSS -->
<link
	href="css/custom.css"
	rel="stylesheet"
>
</head>
<body
	data-spy="scroll"
	data-target="#secondary_nav"
	data-offset="75"
>

	<%
		String role = (String)request.getSession().getAttribute("role");
		String referer = request.getHeader("Referer");
		if(referer == null) {
			response.sendRedirect("html/login2.html");
		} else if((role == null || !role.equals("seller"))) {
			response.sendRedirect("html/login2.html");
		}
		%>
		
	<header class="header_in clearfix">
		<div class="container">
			<div id="logo">
				<a><img
					src="img/logo_sticky.svg"
					width="140"
					height="35"
					alt=""
				></a>
			</div>
			<div class="layer"></div>
			<!-- Opacity Mask Menu Mobile -->
			<ul
				id="top_menu"
				class="drop_user"
			>
				<li><div class="dropdown user clearfix">
						<a
							href="#"
							data-toggle="dropdown"
						><figure>
								<img
									src="img/avatar.jpg"
									alt=""
								>
							</figure>
							<span>
							<% 					
								String username = request.getParameter("username");
								if(username==null || username.equals("null")){
									//response.sendRedirect("html/login2.html");
									out.print("Not Login, ");
								}else{
									out.print(username+", ");
								}

							
							String restaurantName=null; 
							float rate=0;
							String displayAddress="";
							try{
								
								ApplicationDB db = new ApplicationDB();	
								Connection con = db.getConnection();
							
								//Create a SQL statement
								Statement stmt = con.createStatement();
								
								ResultSet rs = null;
								String query ="SELECT * FROM demo.restaurant where username = '"+username+"'";
								PreparedStatement ps = con.prepareStatement(query);
								rs = ps.executeQuery();
								
								String backGroundURL = null;
								String isReserved = null;
								while(rs!= null && rs.next()) {
									backGroundURL = rs.getString("imgUrl");
									rate=rs.getFloat("rate");
									restaurantName = rs.getString("restaurantName");
									displayAddress=(rs.getString("address")+", "+rs.getString("city")+", "+rs.getString("country"));
									isReserved = rs.getString("openReservation");
								}
								ResultSet rs2 = null;
								String query2 ="SELECT * FROM demo.Foods where RestaurantName = '"+restaurantName+"'";
								PreparedStatement ps2 = con.prepareStatement(query2);
								rs2 = ps2.executeQuery();
		
		
		
	
							%>
							</span></a>
<!-- 							username here ！ -->
						<div class="dropdown-menu">
							<div class="dropdown-menu-content">
								<ul>
									<li><a href="jsp/sellerHasOrder.jsp?restaurant=<%=restaurantName%>&username=<%=username%>"><i class="icon_document"></i>orders</a></li>
									<li><a href="jsp/userReservation.jsp?username=<%=username%>"><i class="icon_document"></i>Reservations</a></li>		
									<% 
									if(username!=null){
									%>	<li><a href="jsp/logOut.jsp"><i class="icon_key"></i>Log out</a></li>
									<% 
									}else{
									%> 
										<li><a href="html/login2.html"><i class="icon_key"></i>Log in</a></li>
									<%					
									}
									%>
									<li><a href="jsp/deleteAccount.jsp?username=<%=username%>"><i class="icon_key"></i>Delete Account</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /dropdown --></li>
			</ul>
		
		</div>
	</header>
	<!-- /header -->
	
	<main>
		<div
			class="hero_in detail_page background-image"
			data-background="url(<%=backGroundURL%>)"
		>
			<div
				class="wrapper opacity-mask"
				data-opacity-mask="rgba(0, 0, 0, 0.5)"
			>
				<div class="container">
					<div class="main_info">
						<div class="row">
							<div class="col-xl-4 col-lg-5 col-md-6">
								<div class="head">
									<div class="score">
										<strong><%out.print(rate);%></strong>
									</div>
								</div>
								
								<h1><%out.print(restaurantName);%></h1>
								<%out.print(displayAddress);%><a
									href="EditSellerProfile.jsp?username=<%=username%>&restaurantName=<%=restaurantName%>"
									target="blank"
								><br>Edit Profile</a>
								
							</div>
						</div>
						
						<!-- /row -->
					</div>
					<!-- /main_info -->
				</div>
			</div>
		</div>
		<!--/hero_in-->
		<nav class="secondary_nav sticky_horizontal">
			<div class="container">
				<ul id="secondary_nav">
					<li><a
						class="list-group-item list-group-item-action"
						href="#section-5"
					><i class="icon_chat_alt"></i>Reviews</a></li>
				</ul>
				
				<div onclick="location.href='foodInfo.jsp?username=<%=username%>&restaurantName=<%=restaurantName%>'" class="text-right">
					<a
						href="foodInfo.jsp?username=<%=username%>&restaurantName=<%=restaurantName%>"
						class="btn_1 gradient"
					>Add Food</a>
				</div>
				
			</div>
			<span></span>
		</nav>
		<!-- /secondary_nav -->
		<div class="bg_gray">
			<div class="container margin_detail">
				<div class="row">
					<div class="col-lg-8 list_menu">
						<section id="section-1">
							<h4>All Foods (press to delete)</h4>
							<div class="row">
							
							<%
							int count = 1;
							while(rs2!= null && rs2.next()) {
							%>
							
								<div onclick="location.href='jsp/deleteFood.jsp?username=<%=username%>&restaurantName=<%=restaurantName%>&foodName=<%=rs2.getString("FoodName")%>'" class="col-md-6" >
									<a
										class="menu_item modal_dialog">
<!-- 										href="#modal-dialog" -->
									<figure>
											<img
												src=<%=rs2.getString("PhotoURL") %>
												data-src=<%=rs2.getString("PhotoURL") %>
												alt="thumb"
												class="lazy"
											>
										</figure>
										<h3><%=count%>. <%=rs2.getString("FoodName")%></h3>
										<p><%=rs2.getString("Description")%></p>
										<strong><%=rs2.getString("Price")%></strong></a>
								</div>
								<%
								count++;
								}
								%>
								
								

							</div>
							<!-- /row -->
							<%
							if(isReserved.equals("open")) {
								request.getSession().setAttribute("isReserved", "open");
							
							%>
							<div onclick="location.href='jsp/enableOrDisableReserve.jsp?username=<%=username%>&restaurantName=<%=restaurantName%>'" class="text-right">
							
								<a
									href="jsp/enableOrDisableReserve.jsp?username=<%=username%>&restaurantName=<%=restaurantName%>"
									class="btn_1 gradient"
								>Disable Reservation</a>
							</div>
						<%} else {
							request.getSession().setAttribute("isReserved", "close");
							%>
							<div onclick="location.href='jsp/enableOrDisableReserve.jsp?username=<%=username%>&restaurantName=<%=restaurantName%>'" class="text-right">
							
								<a
									href="jsp/enableOrDisableReserve.jsp?username=<%=username%>&restaurantName=<%=restaurantName%>"
									class="btn_1 gradient"
								>Enable Reservation</a>
							</div>
							<%
						}
							%>
						
						</section>
						<!-- /section -->
<!-- 						<section id="section-2"> -->
<!-- 							<h4>Main Courses</h4> -->
<!-- 							<div class="row"> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-5.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>5. Cheese Quesadilla</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$9.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-6.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>6. Chorizo & Cheese</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$9.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-7.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>7. Beef Taco</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$9.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-8.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>8. Minced Beef Double Layer</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$9.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-9.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>9. Piri Piri Chicken</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$9.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-10.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>10. Burrito Al Pastor</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$9.40</strong></a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							/row -->
<!-- 						</section> -->
<!-- 						/section -->
<!-- 						<section id="section-3"> -->
<!-- 							<h4>Desserts</h4> -->
<!-- 							<div class="row"> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-5.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>5. Cheese Quesadilla</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$9.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-6.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>6. Chorizo & Cheese</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$9.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-7.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>7. Beef Taco</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$9.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-8.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>8. Minced Beef Double Layer</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$9.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-9.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>9. Piri Piri Chicken</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$9.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-10.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>10. Burrito Al Pastor</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$9.40</strong></a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							/row -->
<!-- 						</section> -->
<!-- 						/section -->
<!-- 						<section id="section-4"> -->
<!-- 							<h4>Others</h4> -->
<!-- 							<div class="row"> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-5.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>11. Coca Cola</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$2.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-6.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>12. Corona Beer</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$9.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-7.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>13. Red Wine</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$19.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-8.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>14. White Wine</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$19.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-9.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>15. Mineral Water</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$1.40</strong></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6"> -->
<!-- 									<a -->
<!-- 										class="menu_item modal_dialog" -->
<!-- 										href="#modal-dialog" -->
<!-- 									><figure> -->
<!-- 											<img -->
<!-- 												src="img/menu-thumb-placeholder.jpg" -->
<!-- 												data-src="img/menu-thumb-10.jpg" -->
<!-- 												alt="thumb" -->
<!-- 												class="lazy" -->
<!-- 											> -->
<!-- 										</figure> -->
<!-- 										<h3>16. Red Bull</h3> -->
<!-- 										<p>Fuisset mentitum deleniti sit ea.</p> -->
<!-- 										<strong>$3.40</strong></a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							/row -->
<!-- 						</section> -->
<!-- 						/section -->
					</div>
					<!-- /col -->
					<div
						class="col-lg-4"
						id="sidebar_fixed"
					>

						<div onclick="location.href='html/login2.html'" class="btn_reserve_fixed"  >
							<a
								href="#0"
								class="btn_1 gradient full-width"
								
							>Back to Login</a>
						</div>
					</div>
				</div>
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_gray -->
		<div class="container margin_30_20">
			<div class="row">
				<div class="col-lg-8 list_menu">
					<section id="section-5">
						<h4>Reviews</h4>
						<div class="row add_bottom_30 d-flex align-items-center reviews">
							<div class="col-md-3">
								<div id="review_summary">
									<strong><%out.print(rate);%></strong>
								</div>
							</div>
						</div>
						<%	

						
							query = "SELECT * FROM demo.restaurantRate where restaurantName = '"+restaurantName+"'";
							
							PreparedStatement ps3 = con.prepareStatement(query);
							ResultSet rs3 = ps3.executeQuery();
							
							ArrayList<String> usernames = new ArrayList<String>();
							ArrayList<Float> rates = new ArrayList<Float>();
							ArrayList<String> postTimes = new ArrayList<String>();
							ArrayList<String> titles = new ArrayList<String>();
							ArrayList<String> contents = new ArrayList<String>();
							
							while(rs3!= null && rs3.next()) { 
								usernames.add(rs3.getString("username"));
								rates.add(rs3.getFloat("rate"));
								postTimes.add(rs3.getString("postTime"));
								if(rs3.getString("title")==null || (rs3.getString("title").equals(""))){
									titles.add("No Title");
								}else{
									titles.add(rs3.getString("title"));
								}
								if(rs3.getString("content")==null || (rs3.getString("content").equals(""))){
									titles.add("No Content");
								}else{
									contents.add(rs3.getString("content"));
								}
								
							}
							int n=0;
							for(n=0;n<usernames.size();n++){%>
						<!-- /row -->
						<div id="reviews">
							<!-- /review_card -->
							
							<div class="review_card">
								<div class="row">
									<div class="col-md-2 user_info">
										<figure>
											<img
												src="img/avatar1.jpg"
												alt=""
											>
										</figure>
										<h5><%out.print(usernames.get(n));%></h5>
									</div>
									<div class="col-md-10 review_content">
										<div class="clearfix add_bottom_15">
											<span class="rating"><%out.print(rates.get(n));%><small>/10</small><strong>  Rating
													average</strong></span><em>Published <%out.print(postTimes.get(n));%></em>
										</div>
										<h4><%out.print(titles.get(n));%></h4>
										<p><%out.print(contents.get(n));%></p>
									</div>
								</div>
							</div>
							<%}
							
							con.close();
							}catch (Exception ex) {
								out.print(ex);
							}
							%>
							<!-- /review_card -->
						</div>
						<!-- /reviews -->
						
					</section>
					<!-- /section -->
				</div>
			</div>
		</div>
		<% %>
		<!-- /container -->
	</main>
	<!-- /main -->
	<footer>
		<div class="wave footer"></div>
		<div class="container margin_60_40 fix_mobile">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<h3 data-target="#collapse_1">Quick Links</h3>
					<div
						class="collapse dont-collapse-sm links"
						id="collapse_1"
					>
						<ul>
							<li><a href="about.html">About us</a></li>
							<li><a href="submit-restaurant.html">Add your restaurant</a></li>
							<li><a href="jsp/AskQuestionProcess.jsp?username=<%=username%>">help</a></li>
							<li><a href="account.html">My account</a></li>
							<li><a href="blog.html">Blog</a></li>
							<li><a href="contacts.html">Contacts</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<h3 data-target="#collapse_2">Categories</h3>
					<div
						class="collapse dont-collapse-sm links"
						id="collapse_2"
					>
						<ul>
							<li><a href="discover.jsp">Top
									Categories</a></li>
							<li><a href="grid-listing-filterscol-full-masonry.html">Best
									Rated</a></li>
							<li><a href="grid-listing-filterscol-full-width.html">Best
									Price</a></li>
							<li><a href="grid-listing-filterscol-full-masonry.html">Latest
									Submissions</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<h3 data-target="#collapse_3">Contacts</h3>
					<div
						class="collapse dont-collapse-sm contacts"
						id="collapse_3"
					>
						<ul>
							<li><i class="icon_house_alt"></i>6 MetroTech Center, Brooklyn<br>New York - US</li>
							<li><i class="icon_mobile"></i>+123-456-789</li>
							<li><i class="icon_mail_alt"></i><a href="#0">nyu@nyu.edu</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">

					<div
						class="collapse dont-collapse-sm"
						id="collapse_4"
					>
						<div class="follow_us">
							<h5>Follow Us</h5>
							<ul>
								<li><a href="#0"><img
										src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
										data-src="img/twitter_icon.svg"
										alt=""
										class="lazy"
									></a></li>
								<li><a href="#0"><img
										src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
										data-src="img/facebook_icon.svg"
										alt=""
										class="lazy"
									></a></li>
								<li><a href="#0"><img
										src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
										data-src="img/instagram_icon.svg"
										alt=""
										class="lazy"
									></a></li>
								<li><a href="#0"><img
										src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
										data-src="img/youtube_icon.svg"
										alt=""
										class="lazy"
									></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- /row-->
			<hr>
			<div class="row add_bottom_25">
				<div class="col-lg-6">
					<ul class="footer-selector clearfix">
						<li><img
							src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
							data-src="img/cards_all.svg"
							alt=""
							width="230"
							height="35"
							class="lazy"
						></li>
					</ul>
				</div>
				<div class="col-lg-6">
					<ul class="additional_links">
						<li><a href="https://github.com/AceJW/NYU-ECE9953-FoodDelivery-Web-Project-Spring-2022">Github</a></li>
						<li><span>Jiahao Wang & Jiazhao Shi</span></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!--/footer-->
	<div id="toTop"></div>
	<!-- Back to top button -->
	<!-- Sign In Modal -->
	<div
		id="sign-in-dialog"
		class="zoom-anim-dialog mfp-hide"
	>
		<div class="modal_header">
			<h3>Sign In</h3>
		</div>
		<form>
			<div class="sign-in-wrapper">
				<a
					href="#0"
					class="social_bt facebook"
				>Login with Facebook</a><a
					href="#0"
					class="social_bt google"
				>Login with Google</a>
				<div class="divider">
					<span>Or</span>
				</div>
				<div class="form-group">
					<label>Email</label><input
						type="email"
						class="form-control"
						name="email"
						id="email"
					><i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>Password</label><input
						type="password"
						class="form-control"
						name="password"
						id="password"
						value=""
					><i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_15">
					<div class="checkboxes float-left">
						<label class="container_check">Remember me <input
							type="checkbox"
						><span class="checkmark"></span></label>
					</div>
					<div class="float-right">
						<a
							id="forgot"
							href="javascript:void(0);"
						>Forgot Password?</a>
					</div>
				</div>
				<div class="text-center">
					<input
						type="submit"
						value="Log In"
						class="btn_1 full-width mb_5"
					>Don’t have an account? <a href="account.html">Sign up</a>
				</div>
				<div id="forgot_pw">
					<div class="form-group">
						<label>Please confirm login email below</label><input
							type="email"
							class="form-control"
							name="email_forgot"
							id="email_forgot"
						><i class="icon_mail_alt"></i>
					</div>
					<p>You will receive an email containing a link allowing you to
						reset your password to a new preferred one.</p>
					<div class="text-center">
						<input
							type="submit"
							value="Reset Password"
							class="btn_1"
						>
					</div>
				</div>
			</div>
			
		</form>
		
		<!--form -->
		
	</div>
	<!-- /Modal item order -->
	<!-- COMMON SCRIPTS -->
	<script src="js/common_scripts.min.js"></script>
	<script src="js/common_func.js"></script>
	<script src="assets/validate.js"></script>
	<!-- SPECIFIC SCRIPTS -->
	<script src="js/sticky_sidebar.min.js"></script>
	<script src="js/sticky-kit.min.js"></script>
	<script src="js/specific_detail.js"></script>
</body>
</html>