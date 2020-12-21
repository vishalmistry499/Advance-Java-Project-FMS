<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"  %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>FMS | Payment</title>

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
    <div class="main-navigation menu-2 mb-5" id="mainmenu-area">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary main-nav navbar-togglable rounded-radius">

                <!-- Toggler -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="fa fa-bars"></span>
                </button>

                <!-- Collapse -->
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <!-- Links -->
                    <ul class="navbar-nav  ml-auto">
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
<% session=request.getSession();
	session.setAttribute("TypeOfPurchase","Investment");
	session.setAttribute("TypeOfInvestment","Fixed Deposit");
	double amount=Double.parseDouble(session.getAttribute("amount").toString());
	double tenure=Double.parseDouble(session.getAttribute("tenure").toString());
	double interestRate=Double.parseDouble(session.getAttribute("interestRate").toString());
%>
    <!-- HERO
    ================================================== -->
    <section id="about" class="section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12 col-sm-6 col-md-6">
                    <h1 class="text-center">Best Investment Schemes as per Rate Of Interest</h1>                  
                  
                   <%
				    try
				    {
				        Class.forName("com.mysql.jdbc.Driver");
				        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/fms","root","root");
				        Statement st=con.createStatement();
				        ResultSet rs=st.executeQuery("SELECT * FROM `fd_schemes` WHERE Interest<="+interestRate+" ORDER BY Interest DESC");
				    %>
       
                    <table class="table table-bordered table-hover text-center">
		        <thead class="thead-dark">
		        <tr>
		            <th>Scheme ID</th>
		            <th>Minimum Amount</th>
		            <th>Interest</th>
		            <th>Minimum Tenure</th>
		            <th>Bank Name</th>
		            <th>Application</th>      
		        </tr>
		        </thead>
		        <tbody class="align-center">
		        <%
		        while(rs.next())
       		 {
		        	int rid=rs.getInt("SId");
		        	String toPage="PayInvestment.jsp?id="+rid+"";
            %>
            <tr>
                <td><%=rs.getInt("SId") %></td>
                <td><%=rs.getDouble("Min_Amount")%></td>
                <td><%=rs.getDouble("Interest") %></td>
                 <td><%=rs.getDouble("Min_Tenure")%></td>
                <td><%=rs.getString("Bank") %></td>
                <td><button type="button" class="btn btn-primary btn-block rounded-pill shadow-sm" onclick="window.location.href='<%= toPage %> ' ">Apply Now</button></td>
            </tr>
            <%}%>
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    %>
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
    
</body>
</html>