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
	content="FooYes - Quality delivery or takeaway food"
>
<meta
	name="author"
	content="Ansonika"
>
<title>submit</title>
<!-- Favicons-->
<link
	rel="shortcut icon"
	href="img/favicon.ico"
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
	href="css/submit.css"
	rel="stylesheet"
>
<!-- YOUR CUSTOM CSS -->
<link
	href="css/custom.css"
	rel="stylesheet"
>
</head>
<body>
	
<body
	data-spy="scroll"
	data-target="#secondary_nav"
	data-offset="75"
>
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
		<div
			class="hero_single inner_pages background-image"
			data-background="url(img/home_section_2.jpg)"
		>
			<div
				class="opacity-mask"
				data-opacity-mask="rgba(233, 233, 233, 0.5)"
			>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-10">
							<h1 style="color:#2e2e2e;">Attract New Customers</h1>
							<p style="color:#2e2e2e;">Become a NFWP Restaurant Partner</p>
							<a
								href="#submit"
								class="btn_1 gradient btn_scroll"
							>Apply Now</a>
						</div>
					</div>
					<!-- /row -->
				</div>
			</div>
			<div class="wave hero"></div>
		</div>
		<!-- /hero_single -->
		<div class="container margin_30_20">
			<div class="main_title center">
				<span><em></em></span>
				<h2>Why Submit to NFWP?!</h2>
				<p>New customers and more control than ever over your delivery business.</p>
			</div>
			<div
				class="row justify-content-center align-items-center add_bottom_15"
			>
				<div class="col-lg-6">
					<div class="box_about">
						<h3>Attract new customers</h3>
						<p class="lead">Get instant access to people in your area across NFWP ride and delivery network.</p>
						<p>Increase sales with marketing features that help expand your reach
Use promotional tools to stand out from the crowd and increase visibility.</p>
						<img
							src="img/arrow_about.png"
							alt=""
							class="arrow_1"
						>
					</div>
				</div>
				<div class="col-lg-6 text-center d-none d-lg-block">
					<img
						src="img/about_1.svg"
						alt=""
						class="img-fluid"
						width="250"
						height="250"
					>
				</div>
			</div>
			<!-- /row -->
			<div
				class="row justify-content-center align-items-center add_bottom_15"
			>
				<div class="col-lg-6 text-center d-none d-lg-block">
					<img
						src="img/about_2.svg"
						alt=""
						class="img-fluid"
						width="250"
						height="250"
					>
				</div>
				<div class="col-lg-6">
					<div class="box_about">
						<h3>Turn customers into regulars.</h3>
						<p class="lead">Keep customers ordering again and again with loyalty programs</p>
						<p>Show people you’re listening by responding to reviews
Learn what your customers are loving and what to improve.</p>
						<img
							src="img/arrow_about.png"
							alt=""
							class="arrow_2"
						>
					</div>
				</div>
			</div>
			<!-- /row -->
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-6">
					<div class="box_about">
						<h3>Run your business on your terms.</h3>
						<p class="lead">Accept more orders and customize your offering with our easy-to-use technology.</p>
						<p>Dig into your data anytime to monitor your performance and customer order trends
Streamline your online delivery business without interrupting your operations.</p>
					</div>
				</div>
				<div class="col-lg-6 text-center d-none d-lg-block">
					<img
						src="img/about_3.svg"
						alt=""
						class="img-fluid"
						width="250"
						height="250"
					>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
		<div class="bg_gray">
			<div class="container margin_60_40">
				<div class="main_title center">
					<span><em></em></span>
					<h2>Our Pricing Plans</h2>
					<p>Cum doctus civibus efficiantur in imperdiet deterruisset.</p>
				</div>
				<div class="row plans">
					<div class="plan col-md-4">
						<div class="plan-title">
							<h3>1 Month</h3>
							<p>Free of charge one standard listing</p>
						</div>
						<p class="plan-price">Free</p>
						<ul class="plan-features">
							<li><strong>Check and go</strong>included</li>
							<li><strong>1 month</strong>valid</li>
							<li><strong>Unsubscribe</strong>anytime</li>
						</ul>
						<a
							href="#submit"
							class="btn_1 gray btn_scroll"
						>Submit</a>
					</div>
					<!-- End col-md-4 -->
					<div class="plan plan-tall col-md-4">
						<div class="plan-title">
							<h3>6 Months</h3>
							<p>One time fee for one listing,highlighted in search results</p>
						</div>
						<p class="plan-price">$199</p>
						<ul class="plan-features">
							<li><strong>Premium</strong>support</li>
							<li><strong>Check and go</strong>included</li>
							<li><strong>APP</strong>included</li>
							<li><strong>6 months</strong>valid</li>
							<li><strong>Unsubscribe</strong>anytime</li>
						</ul>
						<a
							href="#submit"
							class="btn_1 gradient btn_scroll"
						>Submit</a>
					</div>
					<!-- End col-md-4 -->
					<div class="plan col-md-4">
						<div class="plan-title">
							<h3>12 Months</h3>
							<p>Monthly subscription for unlimited listings</p>
						</div>
						<p class="plan-price">$299</p>
						<ul class="plan-features">
							<li><strong>Premium</strong>support</li>
							<li><strong>Check and go</strong>included</li>
							<li><strong>12 months</strong>valid</li>
							<li><strong>Unsubscribe</strong>anytime</li>
						</ul>
						<a
							href="#submit"
							class="btn_1 gray btn_scroll"
						>Submit</a>
					</div>
					<!-- End col-md-4 -->
				</div>
				<!-- End row plans-->
			</div>
			<!-- /container -->
		</div>
		<div
			class="container margin_60_20"
			id="submit"
		>
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="text-center add_bottom_15">
						<h4>Please fill the form below</h4>
						<p>Id persius indoctum sed,audiam verear his in,te eum quot
							comprehensam. Sed impetus vocibus repudiare et.</p>
					</div>
					
					<form method="post" action="jsp/sendRestaurant.jsp?username=<%=username%>">
						<!-- /row -->
						<h6>Restaurant data</h6>
						<!-- /row -->
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<input
										type="text"
										class="form-control"
										placeholder="restaurant name"
										name="restaurantName"
										id="restaurantName"
									>
								</div>
							</div>
						</div>
						<!-- /row -->
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<input
										type="text"
										class="form-control"
										placeholder="Categories"
										name="categories"
										id="categories"
									>
								</div>
							</div>
						</div>
						<!-- /row -->
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<input
										type="text"
										class="form-control"
										placeholder="Address"
										name="address"
										id="address"
									>
								</div>
							</div>
						</div>
						<!-- /row -->
						<div class="row add_bottom_15">
							<div class="col-md-6">
								<div class="form-group">
									<input
										type="text"
										class="form-control"
										placeholder="City"
										name="city"
										id="city"
									>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<div class="custom_select submit">
										<select
											name="country"
											id="country"
											class="form-control wide"
										><option value="">Country</option>
											<option value="United States">United States</option>
											<option value="China">China</option></select>
									</div>
								</div>
							</div>
						</div>

						<!-- /row -->
						<button class="btn_1 gradient" type="submit">Apply</button>
					</form>
					
				</div>
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
</body>
</html>