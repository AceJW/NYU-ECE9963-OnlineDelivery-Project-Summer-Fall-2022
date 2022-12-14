<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	content="postReview"
>
<meta
	name="author"
	content="Ansonika"
>
<title>postReview</title>
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
	href="css/review.css"
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
<!-- 							username here ??? -->
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
	<main class="bg_gray">
		<div class="container margin_60_20">
			<div class="row justify-content-center">
				<div class="col-lg-8">
				
				<form method="post" action="jsp/sendReview.jsp">
					<div class="box_general write_review">
						<h1 class="add_bottom_15">Write a review for "
						<%String resturantName=request.getParameter("resturantName");
							out.print(resturantName);
						%>
						"</h1>
						<input type="hidden" name="username" value = "<%=username%>" readonly>
						<input type="hidden" name="resturantName" value = "<%=resturantName%>"readonly>
						<label class="d-block add_bottom_15">Overall rating</label>
						<div class="row">
							<div class="col-md-3 add_bottom_25">
								<div class="add_bottom_15">
									Food Quality <strong class="food_quality_val"></strong>
								</div>
								<input
									type="range"
									min="0"
									max="10"
									step="1"
									value="0"
									data-orientation="horizontal"
									id="food_quality"
									name="food_quality"
								>
							</div>
							<div class="col-md-3 add_bottom_25">
								<div class="add_bottom_15">
									Service <strong class="service_val"></strong>
								</div>
								<input
									type="range"
									min="0"
									max="10"
									step="1"
									value="0"
									data-orientation="horizontal"
									id="service"
									name="service"
								>
							</div>
							<div class="col-md-3 add_bottom_25">
								<div class="add_bottom_15">
									Location <strong class="location_val"></strong>
								</div>
								<input
									type="range"
									min="0"
									max="10"
									step="1"
									value="0"
									data-orientation="horizontal"
									id="location"
									name="location"
								>
							</div>
							<div class="col-md-3 add_bottom_25">
								<div class="add_bottom_15">
									Price <strong class="price_val"></strong>
								</div>
								<input
									type="range"
									min="0"
									max="10"
									step="1"
									value="0"
									data-orientation="horizontal"
									id="price"
									name="price"
								>
							</div>
						</div>
						<div class="form-group">
							<label>Title of your review</label><input
								class="form-control"
								type="text"
								placeholder="If you could say it in one sentence, what would you say?"
								name="reviewTitle"
							>
						</div>
						<div class="form-group">
							<label>Your review</label>
							<textarea
								class="form-control"
								style="height: 180px;"
								placeholder="Write your review to help others learn about this online business"
								name="reviewContent"
							></textarea>
						</div>
						<div class="form-group">
							<button 
								type="submit"
								id="submit2"
								class="btn_1 add_bottom_15"
							>Submit</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
<!-- 		review part end -->
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
					>Don???t have an account? <a href="account.html">Sign up</a>
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
	</main>
	<script src="js/common_scripts.min.js"></script>
	<script src="js/common_func.js"></script>
	<script src="assets/validate.js"></script>
</body>
</html>