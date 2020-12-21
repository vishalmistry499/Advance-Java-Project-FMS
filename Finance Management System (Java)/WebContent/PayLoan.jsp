<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.concurrent.ThreadLocalRandom" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@page import="java.util.*" %>
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
	<%
		session=request.getSession();
		if(session.getAttribute("TId")==null)
		{
			session.setAttribute("TId",1);
		}
		int TId=Integer.parseInt(session.getAttribute("TId").toString());
		int randomNum = TId+ThreadLocalRandom.current().nextInt(10,1000);
		session.setAttribute("TId",randomNum);
		session.setAttribute("TypeOfPurchase","Loan");
		session.setAttribute("TypeOfInvestment","Home Loan");
		String bank=request.getParameter("hid");
		double Amount=Double.parseDouble(request.getParameter("amt"));
		double Tenure=Double.parseDouble(request.getParameter("years"));
		String uname=session.getAttribute("CustName").toString();
		String city=session.getAttribute("CustCity").toString();
		String state=session.getAttribute("CustState").toString();
		String Address=city +"," +state;
		SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yy");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/fms","root","root");
			String sql="Select * from home_loan where Bank='"+bank+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			while(rs.next())
			{
				int id=rs.getInt("SId");
				String Bankname=rs.getString("Bank");
				double Interest=rs.getDouble("Interest");
				session.setAttribute("SchemeId", id);
				session.setAttribute("CustBankName",Bankname);
				session.setAttribute("CustTenure",Tenure);
				session.setAttribute("CustAmount",Amount);
				session.setAttribute("CustInterest",Interest);
				session.setAttribute("CustBankName",Bankname);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	%>
    <!-- HERO
    ================================================== -->
    <section id="about" class="section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12 col-sm-6 col-md-6">
                    <h1>Payment</h1>    
                    <form id="form1" action="Transaction" method="Post">              
                        <div class="form-group row">
                            <div class="col-2">
                                <label class="col-form-label">Transaction ID</label>
                            </div>
                            <div class="col-3">
                                <input type="text" readonly class="form-control-plaintext" id="tid" name="TId" value=<%= session.getAttribute("TId").toString()%>>
                            </div>
                            <div class="col-2">
                                <label class="col-form-label">Payment Date</label>
                            </div>
                            <div class="col-3">
                                <input type="text" class="form-control-plaintext" id="currentDate" name="PaymentDate" value=<%=format.format(new Date()) %>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-2">
                                <label class="col-form-label">Name of Customer</label>
                            </div>
                            <div class="col-3">
                                <input type="text" readonly class="form-control-plaintext" id="name" value="${sessionScope.CustName}" name="CustName">
                            </div>
                            <div class="col-2">
                                <label class="col-form-label">Email Address</label>
                            </div>
                            <div class="col-3">
                                <input type="text" readonly class="form-control-plaintext" id="email" value=<%= session.getAttribute("CustEmail").toString() %> name="CustEmail">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-2">
                                <label class="col-form-label">Address</label>
                            </div>
                            <div class="col-3">
                                <input type="text" readonly class="form-control-plaintext" id="address" value=<%= Address %> name="CustAddress">
                            </div>
                            <div class="col-2">
                                <label class="col-form-label">Country</label>
                            </div>
                            <div class="col-3">
                                <input type="text" readonly class="form-control-plaintext" id="address"  name="CustCountry" value=<%= session.getAttribute("CustCountry").toString() %>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-2">
                                <label class="col-form-label">Type of Purchase</label>
                            </div>
                            <div class="col-3">
                                <input type="text" readonly class="form-control-plaintext" id="purchase"  name="TypeOfPurchase" value=<%= session.getAttribute("TypeOfPurchase").toString() %>>
                            </div>
                            <div class="col-2">
                                <label class="col-form-label">Interest Rate(%)</label>
                            </div>
                            <div class="col-3">
                                <input type="text" readonly class="form-control-plaintext" id="intRate"  name="CustInterest" value=<%= session.getAttribute("CustInterest").toString() %>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-2">
                                <label class="col-form-label" id="purchaseValue">Type of Investment</label>
                            </div>
                            <div class="col-3">
                                <input type="text" readonly class="form-control-plaintext" id="financeValue"  name="TypeOfInvestment" value=<%= session.getAttribute("TypeOfInvestment").toString() %>>
                            </div>
                            <div class="col-2">
                                <label class="col-form-label">Service Provider</label>
                            </div>
                            <div class="col-3">
                                <input type="text" readonly class="form-control-plaintext" id="provider"  name="BankName" value=<%= session.getAttribute("CustBankName").toString() %>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-2">
                                <label class="col-form-label">Amount(Rs)</label>
                            </div>
                            <div class="col-3">
                                <input type="text" readonly class="form-control-plaintext" id="amount" name="CustAmount" value=<%= session.getAttribute("CustAmount").toString() %>>
                            </div>
                            <div class="col-2">
                                <label class="col-form-label">Tenure(Years)</label>
                            </div>
                            <div class="col-3">
                                <input type="text" readonly class="form-control-plaintext" id="tenure" name="CustTem" value=<%= session.getAttribute("CustTenure").toString() %>>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-8">
                                <button class="btn btn-primary btn-block rounded-pill shadow-sm" type="submit" id="pay" name="pay" onclick="document.getElementById('form1').submit();">Confirm Payment</button>
                            </div>
                        </div>
                    </form>
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
    
    <!--Current Date-->
   <script>
        var d = new Date();
        var dd = d.getDate();
        var mm = d.getMonth() + 1; //January is 0!
        var yyyy = d.getFullYear();

        if (dd < 10) {
            dd = '0' + dd
        }

        if (mm < 10) {
            mm = '0' + mm
        }

        d = dd + '/' + mm + '/' + yyyy;
        document.getElementById("currentDate").innerHTML = '<b>' + d + '</b>';
    </script>
</body>
</html>