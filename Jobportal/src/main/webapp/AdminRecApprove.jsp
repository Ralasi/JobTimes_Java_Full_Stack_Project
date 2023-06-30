<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <title>Auth Recruiter</title>
  </head>
  <body>
  
     <%
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setHeader("Expires", "0"); // Proxy Servers
		
		if(session.getAttribute("username") == null) {
			
			response.sendRedirect("index.html");
		}
	%>
	
   <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
            <a href="index.html" class="navbar-brand d-flex align-items-center text-center py-0 px-4 px-lg-5">
                <h1 class="m-0 text-primary">JobTimes</h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="index.html" class="nav-item nav-link active">Home</a>
                    <a href="about.html" class="nav-item nav-link">About</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Jobs</a>
                        <div class="dropdown-menu rounded-0 m-0">
                            <a href="job-list.html" class="dropdown-item">Job List</a>
                            <a href="job-detail.html" class="dropdown-item">Job Detail</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Sign In</a>
                        <div class="dropdown-menu rounded-0 m-0">
                            <a href="signInAdmin.jsp" class="dropdown-item">Admin</a>
                            <a href="signInRecruiter.jsp" class="dropdown-item">Recruiter</a>
                            <a href="SignInCandidate.jsp" class="dropdown-item">Candidate</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Sign Up</a>
                        <div class="dropdown-menu rounded-0 m-0">
                            <a href="signUpRecruiter.jsp" class="dropdown-item">Recruiter</a>
                            <a href="SignUpCandidate.jsp" class="dropdown-item">Candidate</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu rounded-0 m-0">
                            <a href="category.html" class="dropdown-item">Job Category</a>
                            <a href="testimonial.html" class="dropdown-item">Feedback</a>
                            <!-- <a href="404.html" class="dropdown-item">404</a> -->
                        </div>
                    </div>
                    <a href="contact.html" class="nav-item nav-link">Contact</a>
                </div>
                <a href="post.html" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">Post for a Job<i class="bi bi-check-circle"></i></a>
            </div>
        </nav>
        <!-- Navbar End -->
    <form action="LogOut">
      <input type="submit" class="btn btn-outline-dark" value="Log Out">
     <!--  <a class="btn btn-outline-primary" href="#">Log Out</a> -->
    </form>

  </div>
  
 

  <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <h3 class="display-4">Pending Recruiter Approvals</h3>
    <br>
    <table class="table">
      <thead class="thead-dark">
        <tr>
          <th scope="col">Recruiter ID</th>
          <th scope="col">Name</th>
          <th scope="col">E-Mail</th>
          <th scope="col">Phone</th>
          <th scope="col">Company Name</th>
          <th scope="col">Website</th>
          <th scope="col">Authorize</th>
        </tr>
      </thead>

		<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/jobportal?useTimeZone=true&serverTimezone=UTC" user="root" password="Safi@2002"/>
		
		<sql:query var="rs" dataSource="${db}">select rid, name, email, phone, compname, compwebsite from recruiters where authorized="Unauthorized"</sql:query>
		
		
      <tbody>
        
          <c:forEach items="${rs.rows}" var="rec"> 
          <tr>
	          <td><c:out value="${rec.rid}"></c:out></td>
	          <td><c:out value="${rec.name}"></c:out></td>
	          <td><c:out value="${rec.email}"></c:out></td>
	          <td><c:out value="${rec.phone}"></c:out></td>
	          <td><c:out value="${rec.compname}"></c:out></td>
	          <td><c:out value="${rec.compwebsite}"></c:out></td>
	          <td><a href="AdminSetAutho.jsp?${rec.rid}">Authorize</a></td>
	        </tr>
          </c:forEach>
      </tbody>
    </table>
  </div>
  
  <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <a class="btn btn-primary btn-lg" href="AdminViewAllRec.jsp" role="button">View All Recruiters</a>
  </div>
  
  
	<!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Company</h5>
                        <a class="btn btn-link text-white-50" href="about.html">About Us</a>
                        <a class="btn btn-link text-white-50" href="contact.html">Contact Us</a>
                        <a class="btn btn-link text-white-50" href="index.html">Our Services</a>
                        <a class="btn btn-link text-white-50" href="privacy.html">Privacy Policy</a>
                        <a class="btn btn-link text-white-50" href="termsAndCondition.html">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Quick Links</h5>
                        <a class="btn btn-link text-white-50" href="about.html">About Us</a>
                        <a class="btn btn-link text-white-50" href="contact.html">Contact Us</a>
                        <a class="btn btn-link text-white-50" href="index.html">Our Services</a>
                        <a class="btn btn-link text-white-50" href="privacy.html">Privacy Policy</a>
                        <a class="btn btn-link text-white-50" href="termsAndCondition.html">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Contact</h5>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>Bhubaneswar,India</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+91 8249006524</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>ralsirasil@gmail.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href="https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoiZW4ifQ%3D%3D%22%7D"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href="https://www.linkedin.com/feed/"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Sign up</h5>
                        <p>Ready to take the next step?</p>
                        <p>Create an account or sign in.</p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="Enter your email">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="">JobTimes.com</a>, All Right Reserved. 
							
							
							Designed By <a class="border-bottom" href="">Ralasi Rasila Sahoo</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="index.html">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="faq.html">FAQs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>

