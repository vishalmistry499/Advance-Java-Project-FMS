<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Finance Management System</title>

    <!-- bootstrap.min css -->
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
    <!-- Animate Css -->
    <link rel="stylesheet" href="plugins/animate-css/animate.css">
    <!-- Icon Font css -->
    <link rel="stylesheet" href="plugins/fontawesome/css/all.css">
    <link rel="stylesheet" href="plugins/fonts/Pe-icon-7-stroke.css">
    <!-- Themify icon Css -->
    <link rel="stylesheet" href="plugins/themify/css/themify-icons.css">
    <!-- Slick Carousel CSS -->
    <link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
    <link rel="stylesheet" href="plugins/slick-carousel/slick/slick-theme.css">

    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body id="top-header">
    <!-- LOADER TEMPLATE -->
    <div class="logo-bar d-none d-md-block d-lg-block bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo d-none d-lg-block">
                        <!-- Brand -->
                        <a class="navbar-brand js-scroll-trigger" href="index.html">
                            <h2>Finance Management System</h2>
                        </a>
                    </div>
                </div>

                <div class="col-lg-8 justify-content-end ml-lg-auto d-flex col-12">

                    <div class="top-info-block d-inline-flex">
                        <div class="icon-block">
                            <i class="ti-email"></i>
                        </div>
                        <div class="info-block">
                            <h5 class="font-weight-500">fms_admin@gmail.com</h5>
                            <p>Email Us</p>
                        </div>
                    </div>
                    <div class="top-info-block d-inline-flex">
                        <div class="icon-block">
                            <i class="ti-time"></i>
                        </div>
                        <div class="info-block">
                            <h5 class="font-weight-500">At Your Service</h5>
                            <p>24x7</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- NAVBAR
    ================================================= -->
    <div class="main-navigation menu-2" id="mainmenu-area">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary main-nav navbar-togglable rounded-radius">

                <!-- Toggler -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="fa fa-bars"></span>
                </button>

                <!-- Collapse -->
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <!-- Links -->
                    <ul class="navbar-nav ml-auto">
                         <li class="nav-item ">
                        <a class="nav-link js-scroll-trigger" href="index.html">
                            Home
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a href="loan.html" class="nav-link js-scroll-trigger">
                            Loans
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a href="investment.html" class="nav-link js-scroll-trigger">
                            Investments
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a href="about.html" class="nav-link js-scroll-trigger">
                            About
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a href="contact.html" class="nav-link">
                            Contact Us
                        </a>
                    </li>
                    <li class="nav-item ">
                         <a href="LogOut" class="nav-link">
                               LogOut
                         </a>
                    </li>
                    </ul>

                </div> <!-- / .navbar-collapse -->
            </nav>
        </div> <!-- / .container -->
    </div>

    <!-- HERO
    ================================================== -->
    <section class="banner-area" id="banner">
        <div class="overlay" style="background-image: url('images/backgrounds/bg1.jpeg')"></div>
        <!-- Content -->
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-md-12 col-lg-12">
                    <div class="banner-content text-center style-2">
                        <!-- Heading -->
                        <h1 class="display-4 mb-5">
                            <b>Finance Management System</b>
                        </h1>
                    </div>
                </div>
            </div> <!-- / .row -->
        </div> <!-- / .container -->
    </section>

    <section id="about" class="section">
        <div class="text-center bg-light mb-2" style="height:150px">
            <h4 id='greet'></h4>
        </div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-sm-6 col-md-6 text-center">
                    <div class="pricing-box">
                        <div class="price-block">
                            <h3>View Investment Schemes as per Rate of Interest</h3>
                        </div>

                        <a href="SearchBestInvestmentByInterest.jsp" target="_blank" class="btn btn-outline-dark btn-circled">View</a>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6 col-md-6 text-center">
                    <div class="pricing-box">
                        <div class="price-block">
                            <h3>View Investment Schemes as per Tenure</h3>
                        </div>

                        <a href="SearchBestInvestmentByTenure.jsp" target="_blank" class="btn btn-outline-dark btn-circled">View</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section" id="service" style="background-color: whitesmoke">
        <div class="container">
            <div class="row justify-content-center mt-3">
                <div class="col-lg-7 pl-4 text-center">
                    <div class="service-heading">
                        <h1>Partners</h1>
                        <p>Get a better deal and start saving money today</p>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-6">
                    <div class="service-block media">
                        <div class="service-icon">
                            <img src="images/partners/sbi.png" width="70" />
                        </div>
                        <div class="service-inner-content media-body">
                            <h4>State Bank of India</h4>
                            <p>Our team are experts in matching you with the right provider.</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="service-block media">
                        <div class="service-icon">
                            <img src="images/partners/post.png" width="70" />
                        </div>
                        <div class="service-inner-content media-body">
                            <h4>Indian Post</h4>
                            <p>Our team are experts in matching you with the right provider.</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 mb-3 col-md-6">
                    <div class="service-block media">
                        <div class="service-icon">
                            <img src="images/partners/bob.png" width="70" />
                        </div>
                        <div class="service-inner-content media-body">
                            <h4>Bank of Baroda</h4>
                            <p>Our team are experts in matching you with the right provider.</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 mb-3 col-md-6">
                    <div class="service-block media ">
                        <div class="service-icon">
                            <img src="images/partners/patym.png" width="70" />
                        </div>
                        <div class="service-inner-content media-body">
                            <h4>Patym</h4>
                            <p>Our team are experts in matching you with the right provider.</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 mb-3 col-md-6">
                    <div class="service-block media ">
                        <div class="service-icon">
                            <img src="images/partners/axis.png" width="70" />
                        </div>
                        <div class="service-inner-content media-body">
                            <h4>Axis Bank</h4>
                            <p>Our team are experts in matching you with the right provider.</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="service-block media">
                        <div class="service-icon">
                            <img src="images/partners/paypal.png" width="70" />
                        </div>
                        <div class="service-inner-content media-body">
                            <h4>PayPal</h4>
                            <p>Our team are experts in matching you with the right provider.</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="service-block media">
                        <div class="service-icon">
                            <img src="images/partners/google.png" width="70" />
                        </div>
                        <div class="service-inner-content media-body">
                            <h4>Google Pay</h4>
                            <p>Our team are experts in matching you with the right provider.</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="service-block media">
                        <div class="service-icon">
                            <img src="images/partners/icici.png" width="70" />
                        </div>
                        <div class="service-inner-content media-body">
                            <h4>ICICI Bank</h4>
                            <p>Our team are experts in matching you with the right provider.</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="service-block media">
                        <div class="service-icon">
                            <img src="images/partners/lic.png" width="70" />
                        </div>
                        <div class="service-inner-content media-body">
                            <h4>LIC</h4>
                            <p>Our team are experts in matching you with the right provider.</p>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-lg-12 text-center">
                    <p class="pl-3">Want to know more about this? <a href="#">Contact us</a></p>
                </div>
            </div>
        </div>
    </section>

    <footer class="section" id="footer">
        <div class="overlay footer-overlay"></div>
        <!--Content -->
        <div class="container">
            <div class="row justify-content-start">
                <div class="col-lg-4 col-sm-12">
                    <div class="footer-widget">
                        <!-- Brand -->
                        <a href="#" class="footer-brand text-white">
                            Finance Management System
                        </a>
                        <p>
                            A place that provided a common service layer for all consumer services related to loans and investments.
                        </p>
                    </div>
                </div>

                <div class="col-lg-3 ml-lg-auto col-sm-12">
                    <div class="footer-widget">
                        <h3>Team</h3>
                        <!-- Links -->
                        <ul class="footer-links ">
                            <li>
                                <p>Riva Desai</p>
                            </li>
                            <li>
                                <p>Hassan Kapadia</p>
                            </li>
                            <li>
                                <p>Aditya Kataria</p>
                            </li>
                            <li>
                                <p>Vishal Mistry</p>
                            </li>
                        </ul>
                    </div>
                </div>


                <div class="col-lg-2 col-sm-6">
                    <div class="footer-widget">
                        <h3>About</h3>
                        <!-- Links -->
                        <ul class="footer-links ">
                            <li>
                                <a href="#">
                                    Services
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    About Us
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Pricing
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Products Shop
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    Contact
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-2 col-sm-6">
                    <div class="footer-widget">
                        <h3>Socials</h3>
                        <!-- Links -->
                        <ul class="list-unstyled footer-links">
                            <li><a href="#"><i class="fab fa-facebook-f"></i>Facebook</a></li>
                            <li>
                                <a href="#">
                                    <i class="fab fa-twitter"></i>Twitter
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fab fa-pinterest-p"></i>Pinterest
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fab fa-linkedin"></i>linkedin
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fab fa-youtube"></i>YouTube
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div> <!-- / .row -->


            <div class="row text-right pt-3">
                <div class="col-lg-12">
                    <!-- Copyright -->
                    <p>
                        &copy; Copyright <strong>Group-1 BE-III CO-E</strong> All rights reserved.
                    </p>
                </div>
            </div> <!-- / .row -->
        </div> <!-- / .container -->
    </footer>
    <!--  Page Scroll to Top  -->
    <a class="scroll-to-top js-scroll-trigger" href="#top-header">
        <i class="fa fa-angle-up"></i>
    </a>
    <!-- Scripts -->
    <!-- Main jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="plugins/bootstrap/js/popper.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Slick Slider -->
    <script src="plugins/slick-carousel/slick/slick.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <!-- Map Js -->
    <script src="plugins/google-map/gmap3.min.js"></script>

    <script src="js/form/contact.js"></script>
    <script src="js/theme.js"></script>
    <script src="greetings.js" type="text/javascript"></script>
	<% 
    	session= request.getSession();
       	double amount=Double.parseDouble(request.getParameter("amount"));
       	double tenure=Double.parseDouble(request.getParameter("tenure"));
       	double interestRate=Double.parseDouble(request.getParameter("interestRate"));
       	session.setAttribute("amount",amount);
       	session.setAttribute("tenure",tenure);
       	session.setAttribute("interestRate",interestRate);
    %>
</body>
</html>
