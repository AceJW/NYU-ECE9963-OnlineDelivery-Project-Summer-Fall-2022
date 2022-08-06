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
	name="author"
	content="Ansonika"
>
<title>Index</title>
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
	href="css/home.css"
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
	String username = null;
	String referer = request.getHeader("Referer");
	if(referer != null && referer.indexOf("storeUserProfile.jsp") != -1) {
		username = request.getParameter("username");
		username = request.getParameter("username");
	} else {
		//Cookie&url username double checker
		Cookie [] cookies =request.getCookies();
		if(cookies!=null){
			for(Cookie cookie: cookies){
				if((cookie.getName().indexOf("nyufoodproject"))!=-1){//find special format cookie 
					username=cookie.getName().substring(14);
// 					out.print(username+", ");
				}
			}
		}
		
	}
	
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String query3 ="SELECT * FROM demo.users where username = '"+username+"'";
		PreparedStatement ps3 = con.prepareStatement(query3);
		rs3 = ps3.executeQuery();
		String backGroundURL = null;
		while(rs3!= null && rs3.next()) {
			backGroundURL = rs3.getString("imgUrl");
		}
		if(backGroundURL==null) {
			backGroundURL="img/avatar.jpg";
		}
		
		String[] imgUrl = new String[6];
		String cate[]=new String[6];
		String rName[]=new String[6];
		String addr[]=new String[6];
		float rate[]=new float[6];
		
		int index=0;
		String query="";
		String topRes="";
		if(username==null||username.equals("null")){
			for(index=0;index<6;index++){
				cate[index]="No Avaliable";
				rName[index]="No Avaliable";
				addr[index]="No Avaliable";
				rate[index]=-1;
				imgUrl[index]="img/location_list_placeholder.png";
			}
		}else{
			query="SELECT *, count(restaurantName) as freq FROM demo.orders where username='"+username+"' Group by restaurantName order by freq desc";
				PreparedStatement ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs!=null&&rs.next()){
					topRes=rs.getString("restaurantName");
					break;
				}
				if(topRes.equals("")||topRes==null||topRes.equals("null")){
					for(index=0;index<6;index++){
						cate[index]="No Avaliable";
						rName[index]="No Avaliable";
						addr[index]="No Avaliable";
						rate[index]=-1;
						imgUrl[index]="img/location_list_placeholder.png";
					}
				}else{
					String query2="SELECT * FROM demo.restaurant order by categories = (select categories FROM demo.restaurant where restaurantName='"+topRes+"') desc";
				PreparedStatement ps2 = con.prepareStatement(query2);
				rs2 = ps2.executeQuery();
				for(index=0;index<6;index++){
					if(rs2 != null && rs2.next()){
						cate[index]=rs2.getString("categories");
						rName[index]=rs2.getString("restaurantName");
						addr[index]=rs2.getString("address")+", "+rs2.getString("city")+", "+rs2.getString("country");
						rate[index]=rs2.getFloat("rate");
						imgUrl[index]=rs2.getString("imgUrl");
					}else{
						cate[index]="No Avaliable";
						rName[index]="No Avaliable";
						addr[index]="No Avaliable";
						rate[index]=-1;
						imgUrl[index]="img/location_list_placeholder.png";
					}
				}
				}
		}
%>
	<header class="header black_nav clearfix element_to_stick">
		<div class="container">
			<div id="logo">
				<a href="index.jsp"><img
					src="img/logo_sticky.svg"
					width="350"
					height="100"
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
									src="<%=backGroundURL%>"
									alt=""
								>
							</figure>
							
						<% 
						
						
						if(username==null || username.equals("null")){
							out.print("Not Login, ");
						}else{
							%>
							<span><%=username+","%></span>
							<% 
// 								out.print(username+", ");
						}
						
// 								
								%>
							</a>
<!-- 							username here ！ -->
						<div class="dropdown-menu">
							<div class="dropdown-menu-content">
								<ul>
									
									<li><a href="editUserProfile.jsp?username=<%=username%>"><i class="icon_cog"></i>Profile</a></li>
									<li><a href="jsp/userPastOrders.jsp?username=<%=username%>"><i class="icon_cog"></i>Past Orders</a></li>
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
						width="350"
						height="100"
						alt=""
					></a>
				</div>
				<ul>
					<li class="submenu"><a
						href="#0"
						class="show-submenu"
					>Home</a>
					<ul>
							<li><a href="index.jsp">Address Autocomplete</a></li>
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
									<li><a href="discover.jsp">List
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
							<li>
							<form method="get" action="jsp/AskQuestionProcess.jsp">
							<a href="jsp/AskQuestionProcess.jsp?username=<%=username%>">help</a>
							</form>
							</li>
							<li><a href="blog.html">Blog</a></li>
							<li><a href="leave-review.html">Leave a review</a></li>
							<li><a href="contacts.html">Contacts</a></li>
							<li><a href="coming_soon/index.jsp">Coming Soon</a></li>
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
		<div class="hero_single version_1">
			<div class="opacity-mask">
				<div class="container">
					<div class="row justify-content-lg-start justify-content-md-center">
						<div class="col-xl-6 col-lg-8">
							<h1>Delivery or Takeaway Food</h1>
							<p>The best restaurants at the best price</p>
<!-- 							search bar -->
							<form
								method="post"
								action="discover.jsp?username=<%=username%>"
							>
								<div class="row no-gutters custom-search-input">
									<div class="col-lg-10">
										<div class="form-group">
											<input
												name="filter"
												class="form-control no_border_r"
												type="text"
												id="autocomplete"
												placeholder="Dishes, restaurants or cuisines"
											>
										</div>
									</div>
									<div class="col-lg-2">
										<button
											class="btn_1 gradient"
											type="submit"
										>Search</button>
									</div>
								</div>
								<!-- /row -->
								<div class="search_trends">
								</div>
							</form>
						</div>
					</div>
					<!-- /row -->
				</div>
			</div>
			<div class="wave hero"></div>
		</div>
		<!-- /container -->
		<div class="bg_gray">
			<div class="container margin_60_40">
				<div class="main_title">
					<span><em></em></span>
					<h2>Recommend To You!</h2>
					<p>Don't know what is your meal? Let's check!</p>
					
				</div>
				<div class="row add_bottom_25">
					<div class="col-lg-6">
						<div class="list_home">
							<ul>
							
								<li><a href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[0]%>"><figure>
											<img
												src="img/location_list_placeholder.png"
												data-src=<%=imgUrl[0]%>
												alt=""
												class="lazy"
											>
										</figure>
										<div class="score">
											<strong><%out.print(rate[0]);%></strong>
										</div>
										<em><%out.print(cate[0]);%></em>
									<h3><%out.print(rName[0]);%></h3>
										<small><%out.print(addr[0]);%></small>
									<ul>
										</ul></a></li>
										
								<li><a href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[1]%>"><figure>
								<%
								%>
											<img
												src="img/location_list_placeholder.png"
												data-src=<%=imgUrl[1]%>
												alt=""
												class="lazy"
											>
										</figure>
										<div class="score">
											<strong><%out.print(rate[1]);%></strong>
										</div>
										<em><%out.print(cate[1]);%></em>
									<h3><%out.print(rName[1]);%></h3>
										<small><%out.print(addr[1]);%></small>
									<ul>
										</ul></a></li>
										
								<li><a href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[2]%>"><figure>
											<img
												src="img/location_list_placeholder.png"
												data-src=<%=imgUrl[2]%>
												alt=""
												class="lazy"
											>
										</figure>
										<div class="score">
											<strong><%out.print(rate[2]);%></strong>
										</div>
										<em><%out.print(cate[2]);%></em>
									<h3><%out.print(rName[2]);%></h3>
										<small><%out.print(addr[2]);%></small>
									<ul>
										</ul></a></li>
										
							</ul>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="list_home">
							<ul>
							
								<li><a href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[3]%>"><figure>
											<img
												src="img/location_list_placeholder.png"
												data-src=<%=imgUrl[3]%>
												alt=""
												class="lazy"
											>
										</figure>
										<div class="score">
											<strong><%out.print(rate[3]);%></strong>
										</div>
										<em><%out.print(cate[3]);%></em>
									<h3><%out.print(rName[3]);%></h3>
										<small><%out.print(addr[3]);%></small>
									<ul>
										</ul></a></li>
										
								<li><a href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[4]%>"><figure>
											<img
												src="img/location_list_placeholder.png"
												data-src=<%=imgUrl[4]%>
												alt=""
												class="lazy"
											>
										</figure>
										<div class="score">
											<strong><%out.print(rate[4]);%></strong>
										</div>
										<em><%out.print(cate[4]);%></em>
									<h3><%out.print(rName[4]);%></h3>
										<small><%out.print(addr[4]);%></small>
									<ul>
										</ul></a></li>
										
								<li><a href="detailRestaurant.jsp?username=<%=username%>&resturantName=<%=rName[5]%>"><figure>
											<img
												src="img/location_list_placeholder.png"
												data-src=<%=imgUrl[5]%>
												alt=""
												class="lazy"
											>
										</figure>
										<div class="score">
											<strong><%out.print(rate[5]);%></strong>
										</div>
										<em><%out.print(cate[5]);%></em>
									<h3><%out.print(rName[5]);%></h3>
										<small><%out.print(addr[5]);%></small>
									<ul>
										</ul></a></li>
										
							</ul>
						</div>
					</div>
				</div>
					<%
					con.close();
					} catch (Exception ex) {
						out.print(ex);
					}%>
				<!-- /row -->
				<div
					class="banner lazy"
					data-bg="url(img/banner_bg_desktop.jpg)"
				>
					<div
						class="wrapper d-flex align-items-center opacity-mask"
						data-opacity-mask="rgba(0, 0, 0, 0.3)"
					>
						<div>
							<small>FooYes Delivery</small>
							<h3>We Deliver to your Office</h3>
							<p>Enjoy a tasty food in minutes!</p>
							<a
								href="discover.jsp"
								class="btn_1 gradient"
							>Start Now!</a>
						</div>
					</div>
					<!-- /wrapper -->
				</div>
				<!-- /banner -->
			</div>
		</div>
		<!-- /bg_gray -->
		<div class="shape_element_2">
			<div class="container margin_60_0">
				<div class="row">
					<div class="col-lg-6">
						<div class="row">
							<div class="col-lg-6">
								<div class="box_how">
									<figure>
										<img
											src="img/lazy-placeholder-100-100-white.png"
											data-src="img/how_1.svg"
											alt=""
											width="150"
											height="167"
											class="lazy"
										>
									</figure>
									<h3>Easly Order</h3>
									<p>Faucibus ante,in porttitor tellus blandit et. Phasellus
										tincidunt metus lectus sollicitudin.</p>
								</div>
								<div class="box_how">
									<figure>
										<img
											src="img/lazy-placeholder-100-100-white.png"
											data-src="img/how_2.svg"
											alt=""
											width="130"
											height="145"
											class="lazy"
										>
									</figure>
									<h3>Quick Delivery</h3>
									<p>Maecenas pulvinar,risus in facilisis dignissim,quam nisi
										hendrerit nulla,id vestibulum.</p>
								</div>
							</div>
							<div class="col-lg-6 align-self-center">
								<div class="box_how">
									<figure>
										<img
											src="img/lazy-placeholder-100-100-white.png"
											data-src="img/how_3.svg"
											alt=""
											width="150"
											height="132"
											class="lazy"
										>
									</figure>
									<h3>Enjoy Food</h3>
									<p>Morbi convallis bibendum urna ut viverra. Maecenas quis
										consequat libero,a feugiat eros.</p>
								</div>
							</div>
						</div>
						<p class="text-center mt-3 d-block d-lg-none">
							<a
								href="submitRestaurant.jsp?username=<%=username%>"
								class="btn_1 medium gradient pulse_bt mt-2"
							>Join Us</a>
						</p>
					</div>
					<div class="col-lg-5 offset-lg-1 align-self-center">
						<div class="intro_txt">
							<div class="main_title">
								<span><em></em></span>
								<h2>Start Your Business Now</h2>
							</div>
							<p class="lead">Depending on how many locations you have, it’s possible to become an NFWP restaurant partner and start accepting orders in just a few days! 
							You can begin the process by signing up here. We’re excited to hear from you!</p>
							<p >A tablet with NFWP Orders helps restaurant partners keep track of new orders, and manage deliveries daily. NFWP Manager software gives deeper access to menus, payment information, 
							sales data, and customer insights. We have got a tech team making sure both tools are up to speed and running smoothly every day.</p>
							<p>
								<a
									href="submitRestaurant.jsp?username=<%=username%>"
									class="btn_1 medium gradient pulse_bt mt-2"
								>Join Us</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /shape_element_2 -->
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
</body>
</html>