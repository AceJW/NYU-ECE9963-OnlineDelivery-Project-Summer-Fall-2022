<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="NYUFood - Quality delivery or takeaway food">
    <meta name="author" content="Ansonika">
    <title>NYUFood - Quality delivery or takeaway food</title><!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
        href="img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
        href="img/apple-touch-icon-144x144-precomposed.png"><!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&display=swap" rel="stylesheet">
    <!-- BASE CSS -->
    <link href="css/bootstrap_customized.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet"><!-- SPECIFIC CSS -->
    <link href="css/order-sign_up.css" rel="stylesheet">
    <link href="css/detail-page.css" rel="stylesheet"><!-- YOUR CUSTOM CSS -->
    <link href="css/custom.css" rel="stylesheet">
</head>

<body>
	<%
	String username = request.getParameter("username");
// 	String restaurantName = request.getParameter("restaurantName");
// 	request.getSession().setAttribute("role", "seller");
	String referer = request.getHeader("Referer");
	if(referer == null) {
		response.sendRedirect("html/login2.html");
	} else if((referer.indexOf("index.jsp")==-1)) {
		response.sendRedirect("html/login2.html");
	}
	%>
    <header class="header_in clearfix">
        <div class="container">
            <div id="logo"><a href="index.jsp?username=<%=username%>"><img src="img/logo_sticky.svg" width="140" height="35" alt=""></a></div>
            <div class="layer"></div><!-- Opacity Mask Menu Mobile -->
            
        </div>
    </header><!-- /header -->
    <main class="bg_gray">
        <div class="container margin_60_20">
            <div class="row justify-content-center">
                <div class="col-xl-6 col-lg-8">
                    <div class="box_order_form">
                        <div class="head">
                            <div class="title">
                                <h3>Profile Details</h3>
                            </div>
                        </div><!-- /head -->
                        <form action="jsp/storeUserProfile.jsp" method="get">
                        <%request.getSession().setAttribute("oldusername", username);%>
	                        <div class="main">
	                            <div class="form-group"><label>Username</label><input class="form-control"
	                                    placeholder="Username" name = username required></div>	                               
	                            <div class="form-group"><label>Communities</label><input class="form-control"
	                                    placeholder="Community Name" name = "communities" required></div> 
	                            <div class="form-group"><label>Address</label><input class="form-control"
	                                    placeholder="Address" name = "address" required></div>       
	                            <div class="form-group"><label>ZIP Code</label><input class="form-control"
	                                    placeholder="ZIP Code" name = "zipcode" required></div>                                               
	                           <div class="form-group"><label>Photo URL</label><input class="form-control"
	                                    placeholder="Photo URL" name = "photoURL"></div>        
	                            <button class="btn_1 gradient full-width mb_5"> Submit Now</button>
	                        </div>
                        </form>
                    </div><!-- /box_order_form -->
                    
                </div><!-- /col -->
            </div><!-- /row -->
        </div><!-- /container -->
    </main><!-- /main -->
    <footer>
        <div class="wave gray footer"></div>
        <div class="container margin_60_40 fix_mobile">
            <div class="row">
                
                <div class="col-lg-3 col-md-6">
                    <h3 data-target="#collapse_3">Contacts</h3>
                    <div class="collapse dont-collapse-sm contacts" id="collapse_3">
                        <ul>
                            <li><i class="icon_house_alt"></i>97845 Baker st. 567<br>Los Angeles - US</li>
                            <li><i class="icon_mobile"></i>+94 423-23-221</li>
                            <li><i class="icon_mail_alt"></i><a href="#0">info@domain.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 data-target="#collapse_4">Keep in touch</h3>
                    <div class="collapse dont-collapse-sm" id="collapse_4">
                        <div id="newsletter">
                            <div id="message-newsletter"></div>
                            <form method="post" action="assets/newsletter.php" name="newsletter_form"
                                id="newsletter_form">
                                <div class="form-group"><input type="email" name="email_newsletter"
                                        id="email_newsletter" class="form-control" placeholder="Your email"><button
                                        type="submit" id="submit-newsletter"><i class="arrow_carrot-right"></i></button>
                                </div>
                            </form>
                        </div>
                        <div class="follow_us">
                            <h5>Follow Us</h5>
                            <ul>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="img/twitter_icon.svg" alt="" class="lazy"></a></li>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="img/facebook_icon.svg" alt="" class="lazy"></a></li>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="img/instagram_icon.svg" alt="" class="lazy"></a></li>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="img/youtube_icon.svg" alt="" class="lazy"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div><!-- /row-->
            <hr>
            <div class="row add_bottom_25">
                <div class="col-lg-6">
                    <ul class="footer-selector clearfix">
                        <li>
                            <div class="styled-select lang-selector"><select>
                                    <option value="English" selected>English</option>
                                    <option value="French">French</option>
                                    <option value="Spanish">Spanish</option>
                                    <option value="Russian">Russian</option>
                                </select></div>
                        </li>
                        <li>
                            <div class="styled-select currency-selector"><select>
                                    <option value="US Dollars" selected>US Dollars</option>
                                    <option value="Euro">Euro</option>
                                </select></div>
                        </li>
                        <li><img src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                data-src="img/cards_all.svg" alt="" width="198" height="30" class="lazy"></li>
                    </ul>
                </div>
                <div class="col-lg-6">
                    <ul class="additional_links">
                        <li><a href="#0">Terms and conditions</a></li>
                        <li><a href="http://www.bootstrapmb.com/">Privacy</a></li>
                        <li><span>© Foogra</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <!--/footer-->
    <div id="toTop"></div><!-- Back to top button -->
    <!-- Sign In Modal -->
    <div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
        <div class="modal_header">
            <h3>Sign In</h3>
        </div>
        <form>
            <div class="sign-in-wrapper"><a href="#0" class="social_bt facebook">Login with Facebook</a><a href="#0"
                    class="social_bt google">Login with Google</a>
                <div class="divider"><span>Or</span></div>
                <div class="form-group"><label>Email</label><input type="email" class="form-control" name="email"
                        id="email"><i class="icon_mail_alt"></i></div>
                <div class="form-group"><label>Password</label><input type="password" class="form-control"
                        name="password" id="password" value=""><i class="icon_lock_alt"></i></div>
                <div class="clearfix add_bottom_15">
                    <div class="checkboxes float-left"><label class="container_check">Remember me <input
                                type="checkbox"><span class="checkmark"></span></label></div>
                    <div class="float-right"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
                </div>
                <div class="text-center"><input type="submit" value="Log In" class="btn_1 full-width mb_5">Don’t have an
                    account? <a href="account.html">Sign up</a></div>
                <div id="forgot_pw">
                    <div class="form-group"><label>Please confirm login email below</label><input type="email"
                            class="form-control" name="email_forgot" id="email_forgot"><i class="icon_mail_alt"></i>
                    </div>
                    <p>You will receive an email containing a link allowing you to reset your password to a new
                        preferred one.</p>
                    <div class="text-center"><input type="submit" value="Reset Password" class="btn_1"></div>
                </div>
            </div>
        </form>
        <!--form -->
    </div><!-- /Sign In Modal -->
    <!-- COMMON SCRIPTS -->
    <script src="js/common_scripts.min.js"></script>
    <script src="js/common_func.js"></script>
    <script src="assets/validate.js"></script><!-- SPECIFIC SCRIPTS -->
    <script src="js/sticky_sidebar.min.js"></script>
    <script>$('#sidebar_fixed').theiaStickySidebar({ minWidth: 991, updateSidebarHeight: false, additionalMarginTop: 30 });</script>
</body>

</html>