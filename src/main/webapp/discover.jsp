<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*" import = "objects.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
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
	content=""
>
<meta
	name="author"
	content="Ansonika"
>
<title>Discover</title>
<!-- Favicons-->
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
	href="css/listing.css"
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
	<header class="header_in clearfix">
		<div class="container">
			<div id="logo">
				<a href="index.jsp"><img
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
<!-- 								get username -->
								<% 
// 								Cookie&url username double checker
								String username = null;
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
								%>
								</span></a>
	<!-- 							username here ！ -->
							<div class="dropdown-menu">
								<div class="dropdown-menu-content">
									<ul>
										<li><a href="#0"><i class="icon_cog"></i>Dashboard</a></li>
										<li><a href="#0"><i class="icon_document"></i>Bookings</a></li>
										<li><a href="#0"><i class="icon_heart"></i>Wish List</a></li>
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
									</ul>
								</div>
							</div>
						</div>
						<!-- /dropdown --></li>
				</ul>
			<!-- /top_menu -->
			<a
				href="#0"
				class="open_close"
			><i class="icon_menu"></i><span>Menu</span></a>
			<nav class="main-menu">
				<div id="header_menu">
					<a
						href="#0"
						class="open_close"
					><i class="icon_close"></i><span>Menu</span></a><a href="index.jsp"><img
						src="img/logo.svg"
						width="162"
						height="35"
						alt=""
					></a>
				</div>
				<ul>
					<li class="submenu"><a
						href="#0"
						class="show-submenu"
					>Home</a>
					<ul>
							<li><a href="index.html">Address Autocomplete</a></li>
							<li><a href="index-2.html">Search by Keyword</a></li>
							<li><a href="index-3.html">Home Version 2</a></li>
							<li><a href="index-4.html">Video Background</a></li>
							<li><a href="index-5.html">GDPR Cookie Bar EU Law</a></li>
							<li><a href="header-user-logged.html">Header User Logged</a></li>
							<li><a href="header-cart-top.html">Header Cart Top</a></li>
						</ul></li>
					<li class="submenu"><a
						href="#0"
						class="show-submenu"
					>Listing</a>
					<ul>
							<li class="third-level"><a href="#0">List pages</a>
							<ul>
									<li><a href="grid-listing-filterscol.html">List
											default</a></li>
									<li><a href="grid-listing-filterscol-map.html">List
											with map</a></li>
									<li><a href="listing-map.html">List side map</a></li>
									<li><a href="grid-listing-masonry.html">List Masonry
											Filter</a></li>
								</ul></li>
							<li class="third-level"><a href="#0">Detail pages</a>
							<ul>
									<li><a href="detail-restaurant.html">Detail page 1</a></li>
									<li><a href="detail-restaurant-2.html">Detail page 2</a></li>
									<li><a href="detail-restaurant-3.html">Detail page 3</a></li>
								</ul></li>
							<li class="third-level"><a href="#0">OpenStreetMap</a>
							<ul>
									<li><a href="grid-listing-filterscol-openstreetmap.html">List
											with map</a></li>
									<li><a href="listing-map-openstreetmap.html">List side
											map</a></li>
									<li><a href="grid-listing-masonry-openstreetmap.html">List
											Masonry Filter</a></li>
								</ul></li>
							<li><a href="submit-restaurant.html">Submit Restaurant</a></li>
							<li><a href="submit-rider.html">Submit Rider</a></li>
							<li><a href="order.html">Order</a></li>
							<li><a href="confirm.html">Confirm Order</a></li>
						</ul></li>
					<li class="submenu"><a
						href="#0"
						class="show-submenu"
					>Other Pages</a>
					<ul>
							<li><a href="404.html">404 Error</a></li>
							<li><a href="help.html">Help</a></li>
							<li><a href="blog.html">Blog</a></li>
							<li><a href="leave-review.html">Leave a review</a></li>
							<li><a href="contacts.html">Contacts</a></li>
							<li><a href="coming_soon/index.html">Coming Soon</a></li>
							<li><a href="register.html">Sign Up</a></li>
							<li><a href="icon-pack-1.html">Icon Pack 1</a></li>
							<li><a href="icon-pack-2.html">Icon Pack 2</a></li>
							<li><a href="shortcodes.html">Shortcodes</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</header>
	<!-- /header -->
	<main>
		<div class="page_header element_to_stick">
			<div class="container">
				<div class="row">
					<div class="col-xl-8 col-lg-7 col-md-7 d-none d-md-block">
							<h1 style="font-size:30px">Feel Free to Pick Your Style!</h1>
<!-- 						<h1>145 restaurants in Convent Street 2983</h1> -->
<!-- 						<a href="#0">Change address</a> -->
					</div>
					<div class="col-xl-4 col-lg-5 col-md-5">
<!-- 					search bar no varibale passed yet need fix!!!!!!!!!!!!!!!!!!!!!!!!!-->
						<form method="post" action="discover.jsp?username="<%=username%>>
							<div class="search_bar_list">
								<input
									name="filter"
									type="text"
									class="form-control"
									placeholder="Dishes, restaurants or cuisines"
								>
								<button type="submit">
								<i class="icon_search"></i>
								</button>
							</div>
						</form>
					</div>
				</div>
				<!-- /row -->
			</div>
		</div>
		<!-- /page_header -->
		<div class="container margin_30_20">
			<div class="row">
				<aside
					class="col-lg-3"
					id="sidebar_fixed"
				>
					<!-- /type_delivery -->
					<a
						href="#0"
						class="open_filters btn_filters"
					>
					<%String filter=request.getParameter("filter"); %>
					<i class="icon_adjust-vert"></i><span>Filters</span></a>
					<form method="post" action="discover.jsp?username=<%=username%>">
					<div class="filter_col">
						<div class="inner_bt clearfix">
							Filters<a
								href="#"
								class="open_filters"
							><i class="icon_close"></i></a>
						</div>
						<div class="filter_type">
							<h4>
								<a
									href="#filter_1"
									data-toggle="collapse"
									class="opened"
								>Sort</a>
							</h4>
							<div
								class="collapse show"
								id="filter_1"
							>
								<ul>
									<li><label class="container_radio">Top-Rated<input
											type="radio"
											name="filter"
											value="Top-Rated"
										/><span class="checkmark"></span></label></li>
									
									<li><label class="container_radio">Newest<input 
											type="radio"
											name="filter"
											Value="Newest"
									/><span class="checkmark"></span></label></li>
								</ul>
							</div>
						</div>
						<!-- /filter_type -->
						<div class="filter_type">
							<h4>
								<a
									href="#filter_2"
									data-toggle="collapse"
									class="closed"
								>Categories</a>
							</h4>
							<div class="collapse" id="filter_2" >	
								<ul>
									<li><label class="container_check">Italian<input type="radio" 
											       name="filter" 
												   value="Italian"
											><span class="checkmark" ></span></label></li>
									<li><label class="container_check">Japanese<input type="radio" 
											       name="filter" 
												   value="Japanese"
											><span class="checkmark" ></span></label></li>
									<li><label class="container_check">Burgers<input type="radio" 
											       name="filter" 
												   value="Burgers"
											><span class="checkmark" ></span></label></li>
									<li><label class="container_check">Vegetarian<input type="radio" 
											       name="filter" 
												   value="Vegetarian"
											><span class="checkmark" ></span></label></li>
									<li><label class="container_check">Bakery<input type="radio" 
											       name="filter" 
												   value="Bakery"
											><span class="checkmark" ></span></label></li>
									<li><label class="container_check">Chinese<input type="radio" 
											       name="filter" 
												   value="Chinese"
											><span class="checkmark" ></span></label></li>
									<li><label class="container_check">Mexican<input type="radio" 
											       name="filter" 
												   value="Mexican"
											><span class="checkmark" ></span></label></li>
								</ul>
							</div>
						</div>
						<!-- /filter_type -->
						<div class="filter_type last">
							<h4>
								<a
									href="#filter_4"
									data-toggle="collapse"
									class="closed"
								>Rating</a>
							</h4>
							<div
								class="collapse"
								id="filter_4"
							>
								<ul>
									<li><label class="container_check">Above-5<input type="radio" 
											       name="filter" 
												   value="Above-5"
											><span class="checkmark" ></span></label></li>
								</ul>
							</div>
						</div>
						<!-- /filter_type -->
					
						<div class="col-lg-2">
							<button
								class="btn_1 gradient"
								type="submit"
							>Filter</button>
						</div>
				
					
					</div>
					</form>
				</aside>
				<div class="col-lg-9">
					
					<!-- /row -->
					<div class="promo">
						<h3>We have everything you want!</h3>
						<p>We have the greatest food to you!</p>
						<i class="icon-food_icon_delivery"></i>
					</div>
					<!-- /promo -->
					<%
					ResultSet rs = null;
					try {
						ApplicationDB db = new ApplicationDB();	
						Connection con = db.getConnection();
						Statement stmt = con.createStatement();
						
						String cate[]=new String[9];
						String rName[]=new String[9];
						String addr[]=new String[9];
						float rate[]=new float[9];
						String[] imgUrl = new String[9];
						int n=0;
						String query="";	
						if(filter == null||filter.equals("") || filter.equals("Top-Rated")){
							query="SELECT* FROM demo.restaurant order by rate desc";
							filter="Top-Rated";
						}else if(filter.equals("Newest")){
							query="SELECT* FROM demo.restaurant order by createTime desc";
						}else if(filter.equals("Above-5")){
							query="SELECT * FROM demo.restaurant where rate > 5 order by rate desc";
						}
						else{
							query="SELECT * FROM demo.restaurant where categories = '"+filter+"'";
						}
						
						PreparedStatement ps = con.prepareStatement(query);
						rs = ps.executeQuery();
						int index=0;
						while(index < 9) {
							if(rs != null && rs.next()){
								cate[index]=rs.getString("categories");
								rName[index]=rs.getString("restaurantName");
								addr[index]=rs.getString("address")+", "+rs.getString("city")+", "+rs.getString("country");
								rate[index]=rs.getFloat("rate");
								imgUrl[index]=rs.getString("imgUrl");
							}else{
								cate[index]="No Avaliable";
								rName[index]="No Avaliable";
								addr[index]="No Avaliable";
								rate[index]=-1;
								imgUrl[index]="img/location_list_placeholder.png";
							}
							index++;
						}
					%>
					<div class="row">
						<div class="col-12">
							<h2 class="title_small"><%out.print(filter);%></h2>
						</div>
						<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
<!-- 						first square -->
							<div class="strip">
								<figure>
									<img
										src="img/lazy-placeholder.png"
										data-src=<%=imgUrl[0]%>
										class="img-fluid lazy"
										alt=""
									>
									<a
										href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[0]%>"
										class="strip_info"
									><small><%out.print(cate[0]);%></small>
									<div class="item_title">
											<h3><%out.print(rName[0]);%></h3>
											<small><%out.print(addr[0]);%></small>
										</div></a>
								</figure>
								<ul>
									
									<li><div class="score">
											<strong><%out.print(rate[0]);%></strong>
										</div></li>
								</ul>
							</div>
<!-- 						first square end-->
						</div>
						<!-- /strip grid -->
						<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
							<div class="strip">
							<!-- 						second square -->
								<figure>
									<img
										src="img/lazy-placeholder.png"
										data-src=<%=imgUrl[1]%>
										class="img-fluid lazy"
										alt=""
									>
									<a
										href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[1]%>"
										class="strip_info"
									><small><%out.print(cate[1]);%></small>
									<div class="item_title">
											<h3><%out.print(rName[1]);%></h3>
											<small><%out.print(addr[1]);%></small>
										</div></a>
								</figure>
								<ul>
									<li><div class="score">
											<strong><%out.print(rate[1]);%></strong>
										</div></li>
								</ul>
									<!-- 						second square end -->
							</div>
						</div>
						<!-- /strip grid -->
						<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
							<div class="strip">
								<figure>
									<img
										src="img/lazy-placeholder.png"
										data-src=<%=imgUrl[2]%>
										class="img-fluid lazy"
										alt=""
									>
									<a
										href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[2]%>"
										class="strip_info"
									><small><%out.print(cate[2]);%></small>
									<div class="item_title">
											<h3><%out.print(rName[2]);%></h3>
											<small><%out.print(addr[2]);%></small>
										</div></a>
								</figure>
								<ul>
		
									<li><div class="score">
											<strong><%out.print(rate[2]);%></strong>
										</div></li>
								</ul>
							</div>
						</div>
						<!-- /strip grid -->
						<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
							<div class="strip">
								<figure>
									<img
										src="img/lazy-placeholder.png"
										data-src=<%=imgUrl[3]%>
										class="img-fluid lazy"
										alt=""
									>
									<a
										href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[3]%>"
										class="strip_info"
									><small><%out.print(cate[3]);%></small>
									<div class="item_title">
											<h3><%out.print(rName[3]);%></h3>
											<small><%out.print(addr[3]);%></small>
										</div></a>
								</figure>
								<ul>
									<li><div class="score">
											<strong><%out.print(rate[3]);%></strong>
										</div></li>
								</ul>
							</div>
						</div>
						<!-- /strip grid -->
						<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
							<div class="strip">
								<figure>
									<img
										src="img/lazy-placeholder.png"
										data-src=<%=imgUrl[4]%>
										class="img-fluid lazy"
										alt=""
									>
									<a
										href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[4]%>"
										class="strip_info"
									><small><%out.print(cate[4]);%></small>
									<div class="item_title">
											<h3><%out.print(rName[4]);%></h3>
											<small><%out.print(addr[4]);%></small>
										</div></a>
								</figure>
								<ul>
			
									<li><div class="score">
											<strong><%out.print(rate[4]);%></strong>
										</div></li>
								</ul>
							</div>
						</div>
						<!-- /strip grid -->
						<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
							<div class="strip">
								<figure>
									<img
										src="img/lazy-placeholder.png"
										data-src=<%=imgUrl[7]%>
										class="img-fluid lazy"
										alt=""
									>
									<a
										href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[5]%>"
										class="strip_info"
									><small><%out.print(cate[5]);%></small>
									<div class="item_title">
											<h3><%out.print(rName[5]);%></h3>
											<small><%out.print(addr[5]);%></small>
										</div></a>
								</figure>
								<ul>
				
									<li><div class="score">
											<strong><%out.print(rate[5]);%></strong>
										</div></li>
								</ul>
							</div>
						</div>
						<!-- /strip grid -->
						<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
							<div class="strip">
								<figure>
									<img
										src="img/lazy-placeholder.png"
										data-src=<%=imgUrl[6]%>
										class="img-fluid lazy"
										alt=""
									>
									<a
										href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[6]%>"
										class="strip_info"
									><small><%out.print(cate[6]);%></small>
									<div class="item_title">
											<h3><%out.print(rName[6]);%></h3>
											<small><%out.print(addr[6]);%></small>
										</div></a>
								</figure>
								<ul>
						
									<li><div class="score">
											<strong><%out.print(rate[6]);%></strong>
										</div></li>
								</ul>
							</div>
						</div>
						<!-- /strip grid -->
						<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
							<div class="strip">
								<figure>
									<img
										src="img/lazy-placeholder.png"
										data-src=<%=imgUrl[7]%>
										class="img-fluid lazy"
										alt=""
									>
									<a
										href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[7]%>"
										class="strip_info"
									><small><%out.print(cate[7]);%></small>
									<div class="item_title">
											<h3><%out.print(rName[7]);%></h3>
											<small><%out.print(addr[7]);%></small>
										</div></a>
								</figure>
								<ul>
					
									<li><div class="score">
											<strong><%out.print(rate[7]);%></strong>
										</div></li>
								</ul>
							</div>
						</div>
						<!-- /strip grid -->
						<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
							<div class="strip">
								<figure>
									<img
										src="img/lazy-placeholder.png"
										data-src=<%=imgUrl[8]%>
										class="img-fluid lazy"
										alt=""
									>
									<a
										href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[8]%>"
										class="strip_info"
									><small><%out.print(cate[8]);%></small>
									<div class="item_title">
											<h3><%out.print(rName[8]);%></h3>
											<small><%out.print(addr[8]);%></small>
										</div></a>
								</figure>
								<ul>
						
									<li><div class="score">
											<strong><%out.print(rate[8]);%></strong>
										</div></li>
								</ul>
							</div>
						</div>
						<!-- /strip grid -->
					<%
					} catch (Exception ex) {
						out.print(ex);
					} %>
						<!-- /strip grid -->
					</div>
					<!-- /row -->
				</div>
				<!-- /col -->
			</div>
		</div>
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
	<!-- /Sign In Modal -->
	<!-- COMMON SCRIPTS -->
	<script src="js/common_scripts.min.js"></script>
	<script src="js/common_func.js"></script>
	<script src="assets/validate.js"></script>
	<!-- SPECIFIC SCRIPTS -->
	<script src="js/sticky_sidebar.min.js"></script>
	<script src="js/specific_listing.js"></script>
</body>
</html>